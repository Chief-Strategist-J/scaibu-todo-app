import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/core/network/helper/queued_request.dart';

class RequestQueue {
  RequestQueue({
    required this.maxConcurrent,
    required this.requestsPerMinute,
  })  : _queue = Queue<QueuedRequest>(),
        _processController = StreamController<void>.broadcast(),
        _windowStart = DateTime.now() {
    _processController.stream.listen(
      (final _) async {
        _processNext();
      },
    );
  }

  final int maxConcurrent;
  final int requestsPerMinute;
  final Queue<QueuedRequest> _queue;
  final StreamController<void> _processController;
  int _activeRequests = 0;
  DateTime _windowStart;
  int _requestsInWindow = 0;

  Future<T> enqueue<T>(final Future<T> Function() request) async {
    final Completer<T> completer = Completer<T>();
    _queue.add(QueuedRequest(request, completer));
    _processController.add(null);
    return completer.future;
  }

  Future<void> _processNext() async {
    if (_queue.isEmpty || !_canProcessRequest()) {
      return;
    }

    final QueuedRequest request = _queue.removeFirst();
    _activeRequests++;
    _requestsInWindow++;

    try {
      final dynamic result = await request.execute();
      request.complete(result);
    } catch (e, stackTrace) {
      request.completeError(e, stackTrace);
    } finally {
      _activeRequests--;
      _processController.add(null);
    }
  }

  bool _canProcessRequest() {
    final DateTime now = DateTime.now();
    if (now.difference(_windowStart) >= const Duration(minutes: 1)) {
      _windowStart = now;
      _requestsInWindow = 0;
    }

    return _activeRequests < maxConcurrent &&
        _requestsInWindow < requestsPerMinute;
  }

  Future<void> dispose() async {
    await _processController.close();
  }
}
