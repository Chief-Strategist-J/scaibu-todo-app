import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/core/network/helper/queued_request.dart';

class RequestQueue {
  final int maxConcurrent;
  final int requestsPerMinute;
  final Queue<QueuedRequest> _queue;
  final StreamController<void> _processController;
  int _activeRequests = 0;
  DateTime _windowStart;
  int _requestsInWindow = 0;

  RequestQueue({
    required this.maxConcurrent,
    required this.requestsPerMinute,
  })  : _queue = Queue<QueuedRequest>(),
        _processController = StreamController<void>.broadcast(),
        _windowStart = DateTime.now() {
    _processController.stream.listen(
      (_) {
        _processNext();
      },
    );
  }

  Future<T> enqueue<T>(Future<T> Function() request) async {
    final completer = Completer<T>();
    _queue.add(QueuedRequest(request, completer));
    _processController.add(null);
    return completer.future;
  }

  void _processNext() async {
    if (_queue.isEmpty || !_canProcessRequest()) return;

    final request = _queue.removeFirst();
    _activeRequests++;
    _requestsInWindow++;

    try {
      final result = await request.execute();
      request.complete(result);
    } catch (e, stackTrace) {
      request.completeError(e, stackTrace);
    } finally {
      _activeRequests--;
      _processController.add(null);
    }
  }

  bool _canProcessRequest() {
    final now = DateTime.now();
    if (now.difference(_windowStart) >= const Duration(minutes: 1)) {
      _windowStart = now;
      _requestsInWindow = 0;
    }

    return _activeRequests < maxConcurrent && _requestsInWindow < requestsPerMinute;
  }

  void dispose() {
    _processController.close();
  }
}
