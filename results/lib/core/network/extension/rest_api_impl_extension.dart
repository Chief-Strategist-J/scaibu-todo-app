import 'package:http/http.dart' as http;
import 'package:todo_app/core/app_library.dart';

/// Extension to add a `processResponse` method to `RestApiImpl`.
extension RestApiImplExtension on RestApiImpl {
  /// Processes the HTTP response and handles errors based on the status code.
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
