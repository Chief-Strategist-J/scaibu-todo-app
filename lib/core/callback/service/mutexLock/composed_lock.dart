import 'dart:async';

import 'package:todo_app/core/callback/service/mutexLock/core/mutex_service.dart';

/// A class that manages multiple mutex locks in a structured manner.
/// It provides mechanisms for acquiring locks sequentially or atomically
/// and ensures proper release of acquired locks.
class ComposedLock {
  /// Creates a [ComposedLock] with a list of mutexes.
  ComposedLock(this._mutexes);

  /// A list of mutex instances that will be locked in a coordinated fashion.
  final List<IMutex> _mutexes;

  /// Acquires all locks sequentially, one after another.
  ///
  /// This method waits for each lock to be acquired before moving to the next.
  /// It ensures that all locks are taken in order but does not guarantee
  /// atomicity.
  Future<void> sequentialLock() async {
    for (final IMutex mutex in _mutexes) {
      await mutex.lock();
    }
  }

  /// Attempts to acquire all locks atomically within a specified [timeout].
  ///
  /// If all locks are acquired within the given duration, it returns `true`.
  /// Otherwise, if any lock fails to be acquired, it releases all previously
  /// acquired locks and returns `false`.
  ///
  /// - Throws a [TimeoutException] if the timeout is exceeded before acquiring
  ///   all locks.
  /// - Uses a stopwatch to track elapsed time and calculate remaining timeout.
  Future<bool> atomicLock(final Duration timeout) async {
    final Stopwatch stopwatch = Stopwatch()..start();
    final List<IMutex> acquired = <IMutex>[];

    try {
      for (final IMutex mutex in _mutexes) {
        final Duration remaining =
            timeout - Duration(milliseconds: stopwatch.elapsedMilliseconds);
        if (remaining.isNegative) {
          throw TimeoutException('Locking timed out');
        }

        final bool success = await mutex.lockWithTimeout(remaining);
        if (!success) {
          throw Exception('Failed to acquire lock');
        }
        acquired.add(mutex);
      }
      return true;
    } catch (e) {
      // Release any previously acquired locks to avoid deadlocks
      for (final IMutex mutex in acquired) {
        mutex.unlock();
      }
      return false;
    }
  }

  /// Releases all acquired locks in reverse order.
  ///
  /// Ensures that locks are released in the opposite order of acquisition
  /// to prevent deadlock scenarios and maintain consistency.
  void releaseAll() {
    for (final IMutex mutex in _mutexes.reversed) {
      mutex.unlock();
    }
  }
}

///
class SimpleMutex implements IMutex {
  ///
  SimpleMutex([this._name = 'Unnamed Mutex']);

  bool _locked = false;
  final String _name;

  @override
  Future<void> lock() async {
    while (_locked) {
      await Future<dynamic>.delayed(const Duration(milliseconds: 10));
    }
    _locked = true;
  }

  @override
  Future<bool> lockWithTimeout(final Duration timeout) async {
    final Stopwatch stopwatch = Stopwatch()..start();
    while (_locked) {
      if (stopwatch.elapsed >= timeout) {
        return false;
      }
      await Future<dynamic>.delayed(const Duration(milliseconds: 10));
    }
    _locked = true;
    return true;
  }

  @override
  void unlock() {
    _locked = false;
  }

  @override
  bool get isUnused => !_locked;

  @override
  String get name => _name;

  @override
  Future<T> protect<T>(final Future<T> Function() criticalSection) async {
    await lock();
    try {
      return await criticalSection();
    } finally {
      unlock();
    }
  }

  @override
  bool tryLock() {
    if (!_locked) {
      _locked = true;
      return true;
    }
    return false;
  }
}
