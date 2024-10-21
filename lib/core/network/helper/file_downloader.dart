import 'package:http/http.dart' as http;
import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/core/error/exceptions.dart';

class FileDownloader {
  final http.Client client;

  FileDownloader({required this.client});

  Future<http.Response> downloadFile({
    required String url,
    required Map<String, String> headers,
    required Duration timeout,
  }) async {
    final response = await client.get(Uri.parse(url), headers: headers).timeout(timeout);

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw ApiException(response.statusCode, 'Download failed with status: ${response.statusCode}');
    }

    return response;
  }
}
