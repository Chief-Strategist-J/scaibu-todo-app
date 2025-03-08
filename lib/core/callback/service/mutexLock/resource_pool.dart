import 'dart:async';
import 'dart:collection';

import 'package:todo_app/core/callback/service/mutexLock/core/mutex_service.dart';

/// A generic resource pool that manages a set of reusable resources.
/// This ensures controlled access to a limited number of resources
/// using a mutual exclusion (mutex) mechanism.
class ResourcePool<T> {
  /// Creates a resource pool with the given resources.
  ///
  /// [poolName] is used to create a unique mutex for synchronization.
  ResourcePool(this._resources, final String poolName)
      : _mutex = MutexService().getMutex('resource-pool-$poolName') {
    _available.addAll(_resources);
  }

  /// The list of resources managed by the pool.
  final List<T> _resources;

  /// Queue holding available resources.
  final Queue<T> _available = Queue<T>();

  /// Mutex to ensure thread-safe access to the resource pool.
  final IMutex _mutex;

  /// Map tracking resources that are currently in use, waiting for release.
  final Map<T, Completer<void>> _releaseCompleters = <T, Completer<void>>{};

  /// Acquires a resource from the pool.
  ///
  /// If no resource is available, this method waits until one is released.
  Future<T> acquire() async => _mutex.protect(() async {
        if (_available.isEmpty) {
          // Wait for a resource to be released
          final Completer<void> completer = Completer<void>();
          final T resource = _resources
              .firstWhere((final T r) => !_releaseCompleters.containsKey(r));
          _releaseCompleters[resource] = completer;
          await completer.future;
        }

        return _available.removeFirst();
      });

  /// Releases a previously acquired resource back into the pool.
  ///
  /// Notifies any waiting requesters that a resource is now available.
  Future<void> release(final T resource) async {
    await _mutex.protect(() async {
      _available.add(resource);

      // Notify a waiting acquirer if any
      final Completer<void>? completer = _releaseCompleters.remove(resource);
      if (completer != null) {
        completer.complete();
      }
    });
  }

  /// Acquires a resource, performs an operation on it, and releases it after
  /// use.
  ///
  /// This ensures that the resource is properly released even if an exception
  /// occurs.
  Future<R> use<R>(final Future<R> Function(T resource) operation) async {
    final T resource = await acquire();
    try {
      return await operation(resource);
    } finally {
      await release(resource);
    }
  }
}
