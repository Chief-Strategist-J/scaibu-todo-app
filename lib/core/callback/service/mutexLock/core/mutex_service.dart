import 'dart:async';
import 'dart:collection';

/// Primary interface for all mutex (mutual exclusion) operations.
///
/// Implementations of this interface should provide mechanisms for
/// acquiring and releasing locks to ensure safe access to shared resources.
abstract class IMutex {
  /// The name of the mutex instance.
  ///
  /// This can be useful for debugging or identifying specific mutexes in logs.
  String get name;

  /// Acquires the lock asynchronously.
  ///
  /// If the lock is already held by another process or thread, this method
  /// will suspend execution until the lock becomes available.
  Future<void> lock();

  /// Releases the lock.
  ///
  /// This method should only be called by the entity that previously acquired
  /// the lock. Unlocking a mutex that is not held may lead to unexpected
  /// behavior.
  void unlock();

  /// Attempts to acquire the lock without blocking.
  ///
  /// Returns `true` if the lock was successfully acquired, otherwise returns
  /// `false`.
  bool tryLock();

  /// Attempts to acquire the lock within a given [timeout] period.
  ///
  /// If the lock is acquired within the timeout, returns `true`. If the timeout
  /// expires before the lock is obtained, returns `false`.
  Future<bool> lockWithTimeout(final Duration timeout);

  /// Executes a [criticalSection] function while ensuring mutual exclusion.
  ///
  /// Acquires the lock, executes the provided asynchronous function, and then
  /// releases the lock after completion. This helps prevent deadlocks and
  /// ensures proper lock management.
  ///
  /// Returns the result of the [criticalSection] function.
  Future<T> protect<T>(final Future<T> Function() criticalSection);

  /// Indicates whether the mutex is currently unused.
  ///
  /// Returns `true` if the mutex has not been locked, otherwise `false`.
  bool get isUnused;
}

/// Interface for mutex metrics collection
/// An interface for collecting various lock-related metrics.
///
/// Implementations of this interface should provide mechanisms to track
/// and report statistics related to locks, such as the number of lock
/// acquisitions, releases, contentions, and timeouts.
abstract class IMetricsCollector {
  /// Increments the count of successful lock acquisitions.
  void incrementLocks();

  /// Increments the count of successful lock releases (unlocks).
  void incrementUnlocks();

  /// Increments the count of lock contentions, which occur when multiple
  /// processes or threads compete for the same lock.
  void incrementContentions();

  /// Increments the count of lock timeouts, which occur when a lock request
  /// fails due to exceeding the allotted waiting time.
  void incrementTimeouts();

  /// Captures a snapshot of the current metrics.
  ///
  /// Returns a [Map] containing key-value pairs representing the recorded
  /// metrics at the time of invocation.
  Map<String, dynamic> snapshot();

  /// Resets all collected metrics to their initial state.
  void reset();
}

/// Interface for managing a pool of mutexes.
///
/// This provides mechanisms to retrieve and release mutex instances
/// by name, ensuring efficient lock management.
abstract class IMutexPool {
  /// Retrieves a mutex instance associated with the given [name].
  ///
  /// If a mutex with the specified name does not exist, an implementation
  /// may create a new one or return an existing instance.
  ///
  /// Returns an [IMutex] instance corresponding to the given [name].
  IMutex getMutex(final String name);

  /// Releases the mutex associated with the given [name].
  ///
  /// Implementations may remove the mutex from the pool or reset its state,
  /// making it available for reuse.
  void releaseMutex(final String name);
}

/// Main service facade that coordinates mutex operations.
///
/// This service provides a singleton-based implementation for managing
/// mutexes and collecting lock-related metrics.
class MutexService {
  /// Returns the singleton instance of [MutexService].
  factory MutexService() => _instance;

  /// Private constructor for singleton implementation.
  ///
  /// Initializes the metrics collector and the mutex pool.
  MutexService._internal()
      : _metrics = MetricsCollector(),
        _mutexPool = MutexPool(MetricsCollector());

  // Singleton implementation
  static final MutexService _instance = MutexService._internal();

  final IMutexPool _mutexPool;
  final IMetricsCollector _metrics;

  // Public API

  /// Retrieves a mutex instance by its [name].
  ///
  /// Uses the internal mutex pool to fetch or create a named mutex.
  IMutex getMutex(final String name) => _mutexPool.getMutex(name);

  /// Releases a mutex associated with the given [name].
  ///
  /// Delegates the operation to the internal mutex pool.
  void releaseMutex(final String name) => _mutexPool.releaseMutex(name);

  /// Retrieves a snapshot of the current metrics.
  ///
  /// Returns a [Map] containing key-value pairs representing collected metrics.
  Map<String, dynamic> getMetrics() => _metrics.snapshot();

  /// Resets all recorded metrics to their initial state.
  void resetMetrics() => _metrics.reset();

  /// Provides access to the metrics collector instance.
  ///
  /// This is primarily used by mutex implementations for recording statistics.
  IMetricsCollector get metrics => _metrics;
}

/// Implementation of mutex metrics collection
class MetricsCollector implements IMetricsCollector {
  int _totalLocks = 0;
  int _totalUnlocks = 0;
  int _contentionCount = 0;
  int _timeoutCount = 0;

  @override
  void incrementLocks() => _totalLocks++;

  @override
  void incrementUnlocks() => _totalUnlocks++;

  @override
  void incrementContentions() => _contentionCount++;

  @override
  void incrementTimeouts() => _timeoutCount++;

  @override
  Map<String, dynamic> snapshot() => <String, dynamic>{
        'totalLocks': _totalLocks,
        'totalUnlocks': _totalUnlocks,
        'contentionCount': _contentionCount,
        'timeoutCount': _timeoutCount,
        'contentionRate':
            _totalLocks > 0 ? _contentionCount / _totalLocks : 0.0,
      };

  @override
  void reset() {
    _totalLocks = 0;
    _totalUnlocks = 0;
    _contentionCount = 0;
    _timeoutCount = 0;
  }
}

/// Represents an entry in the mutex pool for tracking access times.
///
/// This class associates a mutex instance with its last access time,
/// helping manage resource usage and optimize mutex lifecycle management.
class PoolEntry {
  /// Creates a new pool entry for the given [mutex].
  ///
  /// Initializes the [lastAccessTime] to the current timestamp.
  PoolEntry(this.mutex) : lastAccessTime = DateTime.now();

  /// The mutex instance associated with this pool entry.
  final IMutex mutex;

  /// The timestamp of the last access to this mutex.
  ///
  /// This value is updated whenever the mutex is accessed.
  DateTime lastAccessTime;

  /// Updates the last access time to the current timestamp.
  void updateAccessTime() {
    lastAccessTime = DateTime.now();
  }
}

/// Efficient mutex pooling with automatic cleanup.
///
/// This class manages a pool of named mutexes, ensuring efficient reuse
/// and automatic cleanup of unused mutexes after a set expiration period.
class MutexPool implements IMutexPool {
  /// Creates a new [MutexPool] instance with automatic cleanup.
  ///
  /// Starts a periodic cleanup timer to remove expired mutexes.
  MutexPool(this._metrics) {
    _startCleanupTimer();
  }

  /// Interval at which expired mutexes are cleaned up.
  static const Duration _CLEANUP_INTERVAL = Duration(minutes: 5);

  /// Time duration after which an unused mutex is considered expired and
  /// removed.
  static const Duration _MUTEX_EXPIRATION = Duration(minutes: 30);

  /// Internal map storing mutex instances along with their last access time.
  final Map<String, PoolEntry> _pool = <String, PoolEntry>{};

  /// Metrics collector for tracking mutex operations.
  final IMetricsCollector _metrics;

  /// Timer used for periodic cleanup of expired mutexes.
  Timer? _cleanupTimer;

  /// Starts or restarts the periodic cleanup timer.
  ///
  /// Ensures that expired mutexes are removed at regular intervals.
  void _startCleanupTimer() {
    _cleanupTimer?.cancel();
    _cleanupTimer = Timer.periodic(_CLEANUP_INTERVAL, (final _) => _cleanup());
  }

  /// Removes expired mutexes from the pool.
  ///
  /// A mutex is considered expired if it is currently unused and
  /// has not been accessed for longer than [_MUTEX_EXPIRATION].
  void _cleanup() {
    final DateTime now = DateTime.now();
    final List<String> keysToRemove = _pool.entries
        .where((final MapEntry<String, PoolEntry> entry) =>
            entry.value.mutex.isUnused &&
            now.difference(entry.value.lastAccessTime) > _MUTEX_EXPIRATION)
        .map((final MapEntry<String, PoolEntry> entry) => entry.key)
        .toList();

    for (int i = 0; i < keysToRemove.length; i++) {
      final String key = keysToRemove[i];
      _pool.remove(key);
    }
  }

  @override

  /// Retrieves a mutex instance by its [name].
  ///
  /// If a mutex with the specified name exists in the pool, it is returned,
  /// and its last access time is updated. Otherwise, a new mutex is created,
  /// added to the pool, and returned.
  IMutex getMutex(final String name) {
    if (_pool.containsKey(name)) {
      final PoolEntry entry = _pool[name]!..updateAccessTime();
      return entry.mutex;
    }

    final UltraMutex mutex = UltraMutex(name, _metrics);
    _pool[name] = PoolEntry(mutex);
    return mutex;
  }

  @override

  /// Releases and removes the mutex associated with the given [name].
  ///
  /// This allows manual removal of a mutex from the pool.
  void releaseMutex(final String name) {
    _pool.remove(name);
  }
}

/// High-performance mutex implementation with contention handling.
///
/// This mutex supports asynchronous locking, contention tracking, and
/// automatic expiration detection for efficient resource management.
class UltraMutex implements IMutex {
  /// Creates a new [UltraMutex] with the given [name] and [_metrics] collector.
  UltraMutex(this.name, this._metrics);

  // Static constants to avoid redundant allocations.
  static final Future<void> _COMPLETED_FUTURE = Future<void>.value();

  @override

  /// Unique name for this mutex instance.
  final String name;

  /// Metrics collector for tracking lock-related events.
  final IMetricsCollector _metrics;

  // State management

  /// Indicates whether the mutex is currently locked.
  bool _locked = false;

  /// Queue of waiters waiting to acquire the mutex.
  final Queue<_Waiter> _waiters = Queue<_Waiter>();

  /// Timestamp of the last unlock operation.
  DateTime _lastUnlockTime = DateTime.now();

  /// Tracks the number of active operations using this mutex.
  int _activeOperations = 0;

  @override

  /// Checks whether the mutex is considered unused.
  ///
  /// A mutex is unused if:
  /// - No active operations are in progress.
  /// - It is not locked.
  /// - There are no pending waiters.
  /// - It has been idle for more than 10 minutes.
  bool get isUnused =>
      _activeOperations == 0 &&
      !_locked &&
      _waiters.isEmpty &&
      DateTime.now().difference(_lastUnlockTime) > Duration(minutes: 10);

  @override

  /// Protects a critical section with automatic lock handling.
  ///
  /// This ensures that the provided [criticalSection] executes within a
  /// locked state, automatically unlocking the mutex when finished.
  Future<T> protect<T>(final Future<T> Function() criticalSection) async {
    _activeOperations++;
    try {
      await lock();
      try {
        return await criticalSection();
      } finally {
        unlock();
      }
    } finally {
      _activeOperations--;
    }
  }

  @override

  /// Acquires the mutex lock asynchronously.
  ///
  /// If the mutex is already locked, the caller is queued until the
  /// lock is released.
  Future<void> lock() {
    _metrics.incrementLocks();

    // Fast path if mutex is currently available.
    if (!_locked) {
      _locked = true;
      return _COMPLETED_FUTURE;
    }

    // Contention path: queue the requester.
    _metrics.incrementContentions();
    final _Waiter waiter = _Waiter();
    _waiters.add(waiter);
    return waiter.completer.future;
  }

  @override

  /// Releases the mutex lock.
  ///
  /// If there are pending waiters, the next one is scheduled to acquire
  /// the lock.
  void unlock() {
    _metrics.incrementUnlocks();

    if (!_locked) {
      return;
    }

    _lastUnlockTime = DateTime.now();

    if (_waiters.isEmpty) {
      _locked = false;
      return;
    }

    // Find the first non-canceled waiter.
    _Waiter? nextWaiter;
    while (_waiters.isNotEmpty) {
      nextWaiter = _waiters.removeFirst();
      if (!nextWaiter.canceled) {
        break;
      }
      nextWaiter = null;
    }

    if (nextWaiter == null) {
      _locked = false;
      return;
    }

    // Schedule handoff in a micro task to avoid recursive execution.
    scheduleMicrotask(() {
      nextWaiter!.completer.complete();
    });
  }

  @override

  /// Attempts to acquire the mutex lock without waiting.
  ///
  /// Returns `true` if the lock was acquired, otherwise `false`.
  bool tryLock() {
    if (_locked) {
      return false;
    }
    _locked = true;
    _metrics.incrementLocks();
    return true;
  }

  @override

  /// Attempts to acquire the mutex lock within a specified [timeout].
  ///
  /// Returns `true` if the lock was acquired within the given duration,
  /// otherwise `false` if the timeout expires.
  Future<bool> lockWithTimeout(final Duration timeout) {
    if (!_locked) {
      _locked = true;
      _metrics.incrementLocks();
      return Future<bool>.value(true);
    }

    _metrics.incrementContentions();
    final _Waiter waiter = _Waiter();
    _waiters.add(waiter);

    return Future.any(<Future<bool>>[
      waiter.completer.future.then((final _) => true),
      Future<dynamic>.delayed(timeout).then((final _) {
        waiter.canceled = true;
        _metrics.incrementTimeouts();
        return false;
      })
    ]);
  }
}

/// Waiter record for lock queue
class _Waiter {
  final Completer<void> completer = Completer<void>();
  bool canceled = false;
}
