import 'package:todo_app/core/app_library.dart';

/// Represents a queued request with a completer to handle results.
class QueuedRequest {
  /// Initializes a queued request with the request function and completer.
  QueuedRequest(this._request, this._completer);

  final Future<dynamic> Function() _request;
  final Completer<dynamic> _completer;

  /// Executes the request function.
  Future<dynamic> execute() => _request();

  /// Completes the request with a result.
  void complete(final dynamic result) {
    if (!_completer.isCompleted) {
      _completer.complete(result);
    }
  }

  /// Completes the request with an error.
  void completeError(final Object error, [final StackTrace? stackTrace]) {
    if (!_completer.isCompleted) {
      _completer.completeError(error, stackTrace);
    }
  }
}
