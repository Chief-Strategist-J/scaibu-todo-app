import 'package:todo_app/core/app_library.dart';

class AsyncLock {
  bool _locked = false;
  final Queue<Completer<void>> _queue = Queue();

  Future<T> synchronized<T>(Future<T> Function() action) async {
    final completer = Completer<void>();
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

  void processQueue() {
    if (_queue.isNotEmpty && !_locked) {
      _locked = true;
      _queue.removeFirst().complete();
    }
  }
}
