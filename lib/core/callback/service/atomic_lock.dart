import 'dart:async';
import 'dart:collection';

/// A high-performance, optimized atomic lock implementation for Dart.
///
/// This lock provides configurable fairness, spinning, and backoff strategies
/// to optimize lock acquisition in different contention scenarios.
class AtomicLock {
  /// Creates a new atomic lock with customizable parameters.
  ///
  /// - [fairnessEnabled]: Ensures round-robin scheduling among waiting tasks.
  /// - [spinEnabled]: Allows active spinning before queuing.
  /// - [spinCount]: Number of spins before backing off.
  /// - [backoffEnabled]: Enables exponential backoff before queuing.
  /// - [backoffAttempts]: Number of backoff attempts before queueing.
  AtomicLock({
    final bool fairnessEnabled = true,
    final bool spinEnabled = true,
    final int spinCount = 100,
    final bool backoffEnabled = true,
    final int backoffAttempts = 4,
  })  : _fairnessEnabled = fairnessEnabled,
        _spinEnabled = spinEnabled,
        _spinCount = spinCount,
        _backoffEnabled = backoffEnabled,
        _backoffAttempts = backoffAttempts;

  /// Factory constructor optimized for low-latency scenarios.
  factory AtomicLock.lowLatency() => AtomicLock(
        spinCount: 200,
        backoffAttempts: 3,
      );

  /// Factory constructor optimized for high-throughput scenarios.
  factory AtomicLock.highThroughput() => AtomicLock(
        fairnessEnabled: false,
        spinCount: 500,
        backoffAttempts: 6,
      );

  // Internal lock state
  bool _locked = false;

  // Wait queues for managing contention, split into two priority levels.
  final List<Queue<Completer<void>>> _waitQueues =
      List<Queue<Completer<void>>>.generate(
    2,
    (final _) => Queue<Completer<void>>(),
  );
  int _currentQueueIndex = 0;

  // Configuration parameters
  final bool _fairnessEnabled;
  final bool _spinEnabled;
  final int _spinCount;
  final bool _backoffEnabled;
  final int _backoffAttempts;

  // Performance tracking metrics
  final Stopwatch _uptime = Stopwatch()..start();
  int _acquisitions = 0;
  int _contentions = 0;

  // Object pool for completer to reduce memory allocation overhead
  static final List<Completer<void>> _completerPool = <Completer<void>>[];
  static const int _maxPoolSize = 50;

  /// Returns the current lock state.
  bool get isLocked => _locked;

  /// Attempts to acquire the lock.
  ///
  /// - [priority]: Determines the priority of the waiting request (0 or 1).
  Future<void> acquire({final int priority = 0}) async {
    // Fast path: immediate lock acquisition
    if (!_locked) {
      _locked = true;
      _acquisitions++;
      return;
    }

    // Track contention
    _contentions++;

    // Spin-waiting for fast resolution
    if (_spinEnabled) {
      for (int i = 0; i < _spinCount; i++) {
        if (!_locked) {
          _locked = true;
          _acquisitions++;
          return;
        }
      }
    }

    // Exponential backoff strategy
    if (_backoffEnabled) {
      for (int attempt = 0; attempt < _backoffAttempts; attempt++) {
        final int baseDelay = (1 << attempt) * 5;
        final int jitter = DateTime.now().microsecondsSinceEpoch & 7;
        await Future<dynamic>.delayed(
          Duration(microseconds: baseDelay + jitter),
        );

        if (!_locked) {
          _locked = true;
          _acquisitions++;
          return;
        }
      }
    }

    // Queue-based waiting for heavy contention
    final Completer<void> completer;
    if (_completerPool.isEmpty) {
      completer = Completer<void>();
    } else {
      completer = _completerPool.removeLast();
    }

    final int adjustedPriority;
    if (priority > 0) {
      adjustedPriority = 1;
    } else {
      adjustedPriority = 0;
    }

    _waitQueues[adjustedPriority].add(completer);

    try {
      await completer.future;
      _acquisitions++;
    } finally {
      if (_completerPool.length < _maxPoolSize && !completer.isCompleted) {
        _completerPool.add(completer);
      }
    }
  }

  /// Releases the lock, granting access to the next waiting task.
  void release() {
    if (!_locked) {
      throw StateError('Cannot release an unlocked lock');
    }

    Completer<void>? nextWaiter;

    if (_fairnessEnabled) {
      // Round-robin selection across priority queues
      for (int i = 0; i < _waitQueues.length * 2; i++) {
        final int queueIndex = (_currentQueueIndex + i) % _waitQueues.length;
        if (_waitQueues[queueIndex].isNotEmpty) {
          nextWaiter = _waitQueues[queueIndex].removeFirst();
          _currentQueueIndex = (queueIndex + 1) % _waitQueues.length;
          break;
        }
      }
    } else {
      // Strict priority selection
      for (final Queue<Completer<void>> queue in _waitQueues) {
        if (queue.isNotEmpty) {
          nextWaiter = queue.removeFirst();
          break;
        }
      }
    }

    if (nextWaiter != null && !nextWaiter.isCompleted) {
      nextWaiter.complete();
    } else {
      _locked = false;
    }
  }

  /// Attempts to acquire the lock without waiting.
  bool tryAcquire() {
    if (!_locked) {
      _locked = true;
      _acquisitions++;
      return true;
    }
    return false;
  }

  /// Executes a function while holding the lock.
  Future<T> synchronized<T>(
    final Future<T> Function() fn, {
    final Duration timeout = const Duration(seconds: 10),
    final int priority = 0,
  }) async {
    final Completer<T> completer = Completer<T>();
    Timer? timeoutTimer;

    if (timeout != Duration.zero) {
      timeoutTimer = Timer(timeout, () {
        if (!completer.isCompleted) {
          completer.completeError(
            TimeoutException('Lock acquisition timed out', timeout),
          );
        }
      });
    }

    try {
      await acquire(priority: priority);
      final T result = await fn();
      if (!completer.isCompleted) {
        completer.complete(result);
      }
    } catch (e, stackTrace) {
      if (!completer.isCompleted) {
        completer.completeError(e, stackTrace);
      }
    } finally {
      release();
    }

    timeoutTimer?.cancel();
    return completer.future;
  }

  /// Retrieves performance metrics for debugging and monitoring.
  Map<String, dynamic> get metrics => <String, dynamic>{
        'acquisitions': _acquisitions,
        'contentions': _contentions,
        'uptime': _uptime.elapsed.inMilliseconds,
      };

  /// Disposes resources, clearing all wait queues.
  void dispose() {
    _uptime.stop();
    _locked = false;
    for (final Queue<Completer<void>> queue in _waitQueues) {
      queue.clear();
    }
  }
}
