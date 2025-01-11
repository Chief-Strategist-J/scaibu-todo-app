import 'package:todo_app/core/app_library.dart';

/// REST API interface
abstract interface class RestApi {
  Future<T> request<T>({
    final HttpRequestMethod type = HttpRequestMethod.get,
    required final String endPoint,
    final Map<String, dynamic> requestBody = const {},
    final Map<String, String>? headers,
    final String uploadKey = '',
    final String uploadFilePath = '',
    final void Function(int)? onStatusCodeError,
    final Duration? timeout,
    final int maxRetries = 3,
    final HttpResponseType responseType = HttpResponseType.JSON,
  });

  Future<T> handleResponse<T>({
    required final Response response,
    final HttpResponseType responseType = HttpResponseType.JSON,
    final void Function(int)? onStatusCodeError,
  });
}
