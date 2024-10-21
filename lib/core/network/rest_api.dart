import 'package:todo_app/core/app_library.dart';

/// REST API interface
abstract interface class RestApi {
  Future<T> request<T>({
    HttpRequestMethod type = HttpRequestMethod.get,
    required String endPoint,
    Map<String, dynamic> requestBody = const {},
    Map<String, String>? headers,
    String uploadKey = '',
    String uploadFilePath = '',
    void Function(int)? onStatusCodeError,
    Duration? timeout,
    int maxRetries = 3,
    HttpResponseType responseType = HttpResponseType.JSON,
  });

  Future<T> handleResponse<T>({
    required Response response,
    HttpResponseType responseType = HttpResponseType.JSON,
    void Function(int)? onStatusCodeError,
  });
}
