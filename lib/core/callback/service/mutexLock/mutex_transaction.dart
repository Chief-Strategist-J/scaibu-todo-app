import 'package:todo_app/core/callback/service/mutexLock/core/mutex_service.dart';


///
/// A class that manages a transaction involving multiple mutexes, ensuring
/// proper acquisition and release to prevent deadlocks.
class MutexTransaction {
  /// Creates a new mutex transaction with the given set of required mutex
  /// names.
  MutexTransaction(this._requiredMutexNames);

  /// Stores the list of acquired mutexes to ensure they are released properly.
  final List<IMutex> _acquiredMutexes = <IMutex>[];

  /// The set of mutex names required for the transaction.
  final Set<String> _requiredMutexNames;

  /// Begins the transaction by acquiring all required mutexes in a sorted
  /// order.
  /// This sorting helps prevent deadlocks by maintaining a consistent lock
  /// order.
  Future<void> begin() async {
    // Sort mutex names to prevent deadlocks
    final List<String> sortedNames = _requiredMutexNames.toList()..sort();

    // Acquire all mutexes in order
    for (final String name in sortedNames) {
      final IMutex mutex = MutexService().getMutex(name);
      await mutex.lock();
      _acquiredMutexes.add(mutex);
    }
  }

  /// Commits the transaction by releasing all acquired mutexes.
  void commit() {
    _releaseAll();
  }

  /// Rolls back the transaction by releasing all acquired mutexes.
  void rollback() {
    _releaseAll();
  }

  /// Releases all acquired mutexes in reverse order to avoid inconsistencies.
  void _releaseAll() {
    for (final IMutex mutex in _acquiredMutexes.reversed) {
      mutex.unlock();
    }
    _acquiredMutexes.clear();
  }

  /// Executes an operation within the transaction, ensuring proper
  /// mutex acquisition and release.
  ///
  /// - If the operation completes successfully, the transaction commits.
  /// - If an exception occurs, the transaction rolls back and rethrows the
  /// error.
  ///
  /// Returns the result of the operation.
  Future<T> execute<T>(final Future<T> Function() operation) async {
    await begin();
    try {
      final T result = await operation();
      commit();
      return result;
    } catch (e) {
      rollback();
      rethrow;
    }
  }
}
