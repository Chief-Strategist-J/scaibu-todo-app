import 'package:http/http.dart' as http;
import 'package:todo_app/core/app_library.dart';

extension HttpClientExtension on http.Client {
  Future<http.Response> sendRequest(
    String method,
    String url, {
    Object? body,
    Map<String, String>? headers,
    Duration? timeout,
  }) async {
    final uri = Uri.parse(url);
    final request = http.Request(method, uri);

    if (body != null) {
      request.body = body.toString();
    }
    if (headers != null) {
      request.headers.addAll(headers);
    }

    final streamedResponse = await send(request);
    if (timeout != null) {
      return await http.Response.fromStream(streamedResponse).timeout(timeout);
    }
    return await http.Response.fromStream(streamedResponse);
  }
}
