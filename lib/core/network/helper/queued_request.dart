import 'package:todo_app/core/app_library.dart';

class QueuedRequest {
  final Future<dynamic> Function() _request;
  final Completer<dynamic> _completer;

  QueuedRequest(this._request, this._completer);

  Future<dynamic> execute() => _request();

  void complete(dynamic result) {
    if (!_completer.isCompleted) {
      _completer.complete(result);
    }
  }

  void completeError(dynamic error, [StackTrace? stackTrace]) {
    if (!_completer.isCompleted) {
      _completer.completeError(error, stackTrace);
    }
  }
}
