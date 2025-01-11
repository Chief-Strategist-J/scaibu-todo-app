import 'package:http/http.dart' as http;
import 'package:todo_app/core/app_library.dart';

extension RestApiImplExtension on RestApiImpl {
  Future<T> processResponse<T>(
    final http.Response response,
    final HttpResponseType responseType,
    final void Function(int)? onStatusCodeError,
  ) async =>
      handleResponse<T>(
        response: response,
        responseType: responseType,
        onStatusCodeError: onStatusCodeError,
      );
}
