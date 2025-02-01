import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/core/network/helper/queued_request.dart';

/// A queue that manages requests, ensuring concurrency and rate limiting.
class RequestQueue {
  /// Initializes the queue with max concurrent
  /// requests and requests per minute.
  RequestQueue({
    required this.maxConcurrent,
    required this.requestsPerMinute,
  })  : _queue = Queue<QueuedRequest>(),
        _processController = StreamController<void>.broadcast(),
        _windowStart = DateTime.now() {
    _processController.stream.listen(
      (final _) async {
        await _processNext();
      },
    );
  }

  /// The maximum number of concurrent requests.
  final int maxConcurrent;

  /// The number of requests allowed per minute.
  final int requestsPerMinute;

  /// The internal queue that holds the pending requests.
  final Queue<QueuedRequest> _queue;

  /// A controller that triggers the processing of requests.
  final StreamController<void> _processController;

  /// The number of active requests being processed.
  int _activeRequests = 0;

  /// The start time of the current request window.
  DateTime _windowStart;

  /// The number of requests made in the current window.
  int _requestsInWindow = 0;

  /// Adds a new request to the queue and returns a Future.
  Future<T> enqueue<T>(final Future<T> Function() request) async {
    final Completer<T> completer = Completer<T>();
    _queue.add(QueuedRequest(request, completer));
    _processController.add(null);
    return completer.future;
  }

  /// Processes the next request in the queue if possible.
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

  /// Checks if the next request can be processed based on concurrency
  /// and rate limits.
  bool _canProcessRequest() {
    final DateTime now = DateTime.now();
    if (now.difference(_windowStart) >= const Duration(minutes: 1)) {
      _windowStart = now;
      _requestsInWindow = 0;
    }

    return _activeRequests < maxConcurrent &&
        _requestsInWindow < requestsPerMinute;
  }

  /// Disposes the stream controller when no longer needed.
  Future<void> dispose() async {
    await _processController.close();
  }
}
