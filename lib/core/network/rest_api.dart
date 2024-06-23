import 'package:todo_app/core/app_library.dart';

abstract interface class RestApi {
  Future request({
    HttpRequestMethod type = HttpRequestMethod.get,
    required String endPoint,
    required Map<String, dynamic> requestBody,
    Map<String, dynamic>? headers,
    String uploadKey = '',
    String uploadFilePath = '',
    void Function(int)? onStatusCodeError,
  });

  Future handleResponse({
    required Response response,
    HttpResponseType responseType = HttpResponseType.JSON,
    void Function(int)? onStatusCodeError,
  });
}