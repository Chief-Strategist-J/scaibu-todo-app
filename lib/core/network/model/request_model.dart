import 'package:todo_app/core/app_library.dart';

class RequestModel {
  final HttpRequestMethod type;
  final String url;
  final Map<String, String> headers;
  final Map<String, dynamic> body;
  final String uploadKey;
  final String uploadFilePath;
  final Duration timeout;
  final int maxRetries;
  final HttpResponseType responseType;
  final void Function(int)? onStatusCodeError;

  RequestModel({
    required this.type,
    required this.url,
    required this.headers,
    required this.body,
    required this.uploadKey,
    required this.uploadFilePath,
    required this.timeout,
    required this.maxRetries,
    required this.responseType,
    this.onStatusCodeError,
  });
}
