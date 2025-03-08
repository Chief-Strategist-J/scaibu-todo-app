import 'package:todo_app/core/callback/service/mutexLock/core/mutex_service.dart';

/// A Read-Write Lock implementation that allows multiple readers but only
/// one writer.
///
/// This class ensures that:
/// - Multiple readers can acquire the lock simultaneously.
/// - Writers get exclusive access, blocking both readers and other writers.
/// - The first reader acquires the write lock to prevent new writers.
/// - The last reader releases the write lock to allow writers again.
class ReadWriteLock {
  /// Creates a ReadWriteLock with unique mutex names.
  ///
  /// [name] is used to generate unique mutex identifiers.
  ReadWriteLock(final String name)
      : _writeMutex = MutexService().getMutex('$name-write'),
        _readersMutex = MutexService().getMutex('$name-readers-count');

  /// Mutex for write operations, ensuring only one writer at a time.
  final IMutex _writeMutex;

  /// Counter to track the number of active readers.
  int _readers = 0;

  /// Mutex for synchronizing access to the readers count.
  final IMutex _readersMutex;

  /// Acquires a read lock.
  ///
  /// If this is the first reader, it locks the write mutex to prevent writers.
  Future<void> acquireReadLock() async {
    await _readersMutex.protect(() async {
      if (_readers == 0) {
        // First reader must obtain write lock
        await _writeMutex.lock();
      }
      _readers++;
    });
  }

  /// Releases a read lock.
  ///
  /// If this is the last reader, it unlocks the write mutex to allow writers.
  Future<void> releaseReadLock() async {
    await _readersMutex.protect(() async {
      _readers--;
      if (_readers == 0) {
        _writeMutex.unlock();
      }
    });
  }

  /// Executes a read operation within a read lock.
  ///
  /// Ensures that the read lock is acquired before executing [operation]
  /// and released afterward.
  Future<T> read<T>(final Future<T> Function() operation) async {
    await acquireReadLock();
    try {
      return await operation();
    } finally {
      await releaseReadLock();
    }
  }

  /// Executes a write operation within a write lock.
  ///
  /// Ensures exclusive access to [operation] by using the write mutex.
  Future<T> write<T>(final Future<T> Function() operation) async =>
      _writeMutex.protect(operation);
}
