import 'package:http/http.dart' as http;
import 'package:todo_app/core/app_library.dart';

/// A class responsible for downloading files using HTTP client.
class FileDownloader {
  /// Initializes the downloader with an HTTP client.
  FileDownloader({required this.client});

  /// Initializes the downloader with an HTTP client.
  final http.Client client;

  /// Downloads a file from the specified URL with headers and timeout.
  Future<http.Response> downloadFile({
    required final String url,
    required final Map<String, String> headers,
    required final Duration timeout,
  }) async {
    final http.Response response =
        await client.get(Uri.parse(url), headers: headers).timeout(timeout);

    if (response.statusCode < 200 || response.statusCode >= 300) {
      throw ApiException(
        response.statusCode,
        'Download failed with status: ${response.statusCode}',
      );
    }

    return response;
  }
}
