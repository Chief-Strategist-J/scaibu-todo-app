import 'package:todo_app/core/app_library.dart';

/// A class that provides a mechanism to lock asynchronous
/// operations and queue them for execution.
class AsyncLock {
  bool _locked = false;
  final Queue<Completer<void>> _queue = Queue<Completer<void>>();

  /// Ensures that the provided action is executed only
  /// once at a time, in a synchronized manner.
  Future<T> synchronized<T>(final Future<T> Function() action) async {
    final Completer<void> completer = Completer<void>();
    _queue.add(completer);

    if (!_locked) {
      processQueue();
    }
    await completer.future;
    try {
      return await action();
    } finally {
      _locked = false;
      processQueue();
    }
  }

  /// Processes the queue of pending tasks,
  /// allowing the next task to run when the lock is released.
  void processQueue() {
    if (_queue.isNotEmpty && !_locked) {
      _locked = true;
      _queue.removeFirst().complete();
    }
  }
}
