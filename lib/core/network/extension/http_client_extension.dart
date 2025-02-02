import 'package:http/http.dart' as http;

/// Doc required
extension HttpClientExtension on http.Client {
  /// Doc required
  Future<http.Response> sendRequest(
    final String method,
    final String url, {
    final Object? body,
    final Map<String, String>? headers,
    final Duration? timeout,
  }) async {
    final Uri uri = Uri.parse(url);
    final http.Request request = http.Request(method, uri);

    // Set body (supports String, List<int>, or other objects)
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
