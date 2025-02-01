import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:todo_app/core/app_library.dart';

/// Handles file upload functionality.
class FileUploader {
  /// Initializes the uploader with an HTTP client.
  FileUploader({required final Client client}) : _client = client;

  final http.Client _client;

  /// Uploads a file to the specified URL with headers and timeout.
  Future<http.Response> uploadFile({
    required final String url,
    required final String filePath,
    required final String fileKey,
    required final Map<String, String> headers,
    required final Duration timeout,
  }) async {
    final File file = File(filePath);
    final bool isExistFile = !file.existsSync();
    if (!isExistFile) {
      throw FileNotFoundException('File not found: $filePath');
    }

    final Uri uri = Uri.parse(url);
    final http.MultipartRequest request = http.MultipartRequest('POST', uri);
    request.headers.addAll(headers);

    final http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
      fileKey,
      filePath,
      filename: path.basename(filePath),
    );
    request.files.add(multipartFile);

    final http.StreamedResponse streamedResponse =
        await _client.send(request).timeout(timeout);

    return http.Response.fromStream(streamedResponse);
  }
}
