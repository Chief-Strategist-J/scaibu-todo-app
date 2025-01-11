import 'package:todo_app/core/app_library.dart';

class QueuedRequest {
  QueuedRequest(this._request, this._completer);

  final Future<dynamic> Function() _request;
  final Completer<dynamic> _completer;

  Future<dynamic> execute() => _request();

  void complete(final dynamic result) {
    if (!_completer.isCompleted) {
      _completer.complete(result);
    }
  }

  void completeError(final Object error, [final StackTrace? stackTrace]) {
    if (!_completer.isCompleted) {
      _completer.completeError(error, stackTrace);
    }
  }
}
