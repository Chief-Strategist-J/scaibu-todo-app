import 'package:http/http.dart' as http;
import 'package:todo_app/core/app_library.dart';

/// Extension to add a `sendRequest` method to `http.Client`.
extension HttpClientExtension on http.Client {
  /// Sends an HTTP request with the specified method and URL.
  Future<http.Response> sendRequest(
    final String method,
    final String url, {
    final Object? body,
    final Map<String, String>? headers,
    final Duration? timeout,
  }) async {
    final Uri uri = Uri.parse(url);
    final http.Request request = http.Request(method, uri);

    if (body != null) {
      request.body = body.toString();
    }
    if (headers != null) {
      request.headers.addAll(headers);
    }

    final http.StreamedResponse streamedResponse = await send(request);
    if (timeout != null) {
      return http.Response.fromStream(streamedResponse).timeout(timeout);
    }
    return http.Response.fromStream(streamedResponse);
  }
}
