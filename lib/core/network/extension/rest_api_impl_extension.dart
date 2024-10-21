import 'package:http/http.dart' as http;
import 'package:todo_app/core/app_library.dart';

extension RestApiImplExtension on RestApiImpl {
  Future<T> processResponse<T>(
    http.Response response,
    HttpResponseType responseType,
    void Function(int)? onStatusCodeError,
  ) async {
    return handleResponse<T>(
      response: response,
      responseType: responseType,
      onStatusCodeError: onStatusCodeError,
    );
  }
}
