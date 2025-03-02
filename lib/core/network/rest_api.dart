import 'package:http/http.dart' as http show Response;
import 'package:todo_app/core/app_library.dart';

/// Abstract interface for making REST API requests and handling responses.
abstract interface class RestApi {
  /// Makes a REST API request.
  Future<http.Response> request<T>({
    required final String endPoint,
    final HttpRequestMethod type = HttpRequestMethod.get,
    final Map<String, dynamic> requestBody = const <String, dynamic>{},
    final Map<String, String>? headers,
    final String uploadKey = '',
    final String uploadFilePath = '',
    final void Function(int)? onStatusCodeError,
    final Duration? timeout,
    final int maxRetries = 3,
    final HttpResponseType responseType = HttpResponseType.JSON,
  });

  /// Handles the API response.
  Future<T> handleResponse<T>({
    required final Response response,
    final HttpResponseType responseType = HttpResponseType.JSON,
    final void Function(int)? onStatusCodeError,
  });
}
