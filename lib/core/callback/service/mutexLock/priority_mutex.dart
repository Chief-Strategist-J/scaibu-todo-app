import 'dart:async';

import 'package:collection/collection.dart';
import 'package:todo_app/core/callback/service/mutexLock/core/mutex_service.dart';

/// Represents a task waiting to acquire the lock.
class _PriorityWaiter {
  /// Creates a [_PriorityWaiter] with the specified [priority].
  _PriorityWaiter(this.priority);

  /// The priority of the waiting task.
  final int priority;

  /// A [Completer] that is completed when the lock is granted.
  final Completer<void> completer = Completer<void>();
}

/// A mutex (mutual exclusion) mechanism that allows priority-based locking.
///
/// This class ensures that higher-priority tasks acquire the lock before
/// lower-priority ones,
/// using a priority queue to manage waiting tasks.
class PriorityMutex implements IMutex {
  /// Creates a [PriorityMutex] with the given [name].
  ///
  /// Uses an internal [UltraMutex] instance for synchronization.
  PriorityMutex(this.name)
      : _internalMutex = UltraMutex(name, MutexService().metrics);

  /// The internal mutex used for synchronization.
  final IMutex _internalMutex;

  /// The name of the mutex (useful for debugging and metrics).
  @override
  final String name;

  /// A priority queue that holds tasks waiting to acquire the lock.
  ///
  /// Tasks with higher priority values are served first.
  final PriorityQueue<_PriorityWaiter> _waiters =
      PriorityQueue<_PriorityWaiter>(
    (final _PriorityWaiter a, final _PriorityWaiter b) =>
        b.priority.compareTo(a.priority),
  );

  /// Attempts to acquire the lock with a given priority.
  ///
  /// If the lock is available, it is acquired immediately.
  /// Otherwise, the calling task is added to the priority queue and will be
  /// granted the lock when available, based on its priority.
  ///
  /// - [priority]: The priority of the lock request (higher values
  ///  get preference).
  /// - Returns a [Future] that completes when the lock is acquired.
  @override
  Future<void> lock({final int priority = 0}) {
    // If the lock is available, acquire it immediately
    if (_internalMutex.tryLock()) {
      return Future<dynamic>.value();
    }

    // Otherwise, create a waiter with the given priority and add it to the
    // queue
    final _PriorityWaiter waiter = _PriorityWaiter(priority);
    _waiters.add(waiter);

    return waiter.completer.future;
  }

  @override
  bool get isUnused => _internalMutex.isUnused && _waiters.isEmpty;

  @override
  Future<bool> lockWithTimeout(final Duration timeout) async {
    final Completer<bool> completer = Completer<bool>();
    final Timer timer = Timer(timeout, () {
      final List<_PriorityWaiter> remainingWaiters = <_PriorityWaiter>[];
      while (_waiters.isNotEmpty) {
        final _PriorityWaiter waiter = _waiters.removeFirst();
        if (!waiter.completer.isCompleted) {
          remainingWaiters.add(waiter);
        }
      }
      _waiters.addAll(remainingWaiters);
      if (!completer.isCompleted) {
        completer.complete(false);
      }
    });

    await lock();
    if (!completer.isCompleted) {
      completer.complete(true);
    }
    timer.cancel();
    return completer.future;
  }

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
  bool tryLock() => _internalMutex.tryLock();

  @override
  void unlock() {
    _internalMutex.unlock();
    if (_waiters.isNotEmpty) {
      final _PriorityWaiter nextWaiter = _waiters.removeFirst();
      nextWaiter.completer.complete();
    }
  }
}
