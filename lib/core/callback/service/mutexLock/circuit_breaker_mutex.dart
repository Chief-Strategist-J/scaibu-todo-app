import 'dart:async';

import 'package:todo_app/core/callback/service/mutexLock/core/mutex_service.dart';

/// A `CircuitBreaker` implementation to prevent cascading failures
/// in distributed systems by limiting the number of failed operations.
///
/// This class follows the classic circuit breaker pattern:
/// - It allows requests while the failure count is below a threshold.
/// - If failures exceed the threshold, the circuit enters an "open" state,
///   preventing further operations for a specified reset duration.
/// - After the reset timeout, it attempts to allow a request, transitioning
///   back to "closed" if successful.
class CircuitBreakerMutex {
  /// Creates a new `CircuitBreaker` with a given [name].
  ///
  /// - [threshold]: Number of failures before opening the circuit (default: 5).
  /// - [resetTimeout]: Duration before the circuit attempts to
  ///   reset (default: 30s).
  CircuitBreakerMutex(
    this.name, {
    final int threshold = 5,
    final Duration resetTimeout = const Duration(seconds: 30),
  })  : _stateMutex = MutexService().getMutex('circuit-$name'),
        _threshold = threshold,
        _resetTimeout = resetTimeout;

  /// Mutex to ensure thread-safe access to circuit state.
  final IMutex _stateMutex;

  /// Unique name for the circuit breaker instance.
  final String name;

  /// Number of consecutive failures encountered.
  int _failureCount = 0;

  /// Whether the circuit is currently open (blocking requests).
  bool _isOpen = false;

  /// Timestamp of the last attempt to execute an operation.
  DateTime _lastAttempt = DateTime.now();

  /// Failure threshold before the circuit opens.
  final int _threshold;

  /// Duration to wait before allowing retries after the circuit opens.
  final Duration _resetTimeout;

  /// Executes an operation while enforcing the circuit breaker rules.
  ///
  /// - If the circuit is open and the reset timeout has not elapsed, throws
  ///   a [Exception].
  /// - If the operation succeeds, resets the failure count.
  /// - If the operation fails, increments the failure count and may open
  /// the circuit.
  Future<T> execute<T>(final Future<T> Function() operation) async =>
      _stateMutex.protect(() async {
        // Check if circuit is open and if reset timeout has elapsed
        if (_isOpen) {
          if (DateTime.now().difference(_lastAttempt) > _resetTimeout) {
            _isOpen = false; // Reset circuit state after timeout
          } else {
            throw Exception('Circuit $name is open');
          }
        }

        try {
          final T result = await operation();
          _failureCount = 0; // Reset failure count on success
          return result;
        } catch (e) {
          _failureCount++;
          _lastAttempt = DateTime.now();

          if (_failureCount >= _threshold) {
            _isOpen = true; // Open circuit after exceeding failure threshold
          }
          rethrow;
        }
      });
}
