import 'package:todo_app/core/app_library.dart';

abstract interface class RestApi {
  Future request({
    HttpRequestMethod type = HttpRequestMethod.get,
    required String endPoint,
    required Map<String, dynamic> requestBody,
    Map<String, dynamic>? headers,
    String uploadKey = '',
    String uploadFilePath = '',
    required String requestAPIName,
    void Function(int)? onStatusCodeError,
  });

  Future handleResponse({
    required Response response,
    HttpResponseType responseType = HttpResponseType.JSON,
    required String requestAPIName,
    void Function(int)? onStatusCodeError,
  });
}