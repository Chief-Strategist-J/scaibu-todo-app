import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/core/error/exceptions.dart';

/// File upload handling
class FileUploader {
  final http.Client client;

  FileUploader({required this.client});

  Future<http.Response> uploadFile({
    required String url,
    required String filePath,
    required String fileKey,
    required Map<String, String> headers,
    required Duration timeout,
  }) async {
    final file = File(filePath);
    if (!await file.exists()) {
      throw FileNotFoundException('File not found: $filePath');
    }

    final uri = Uri.parse(url);
    final request = http.MultipartRequest('POST', uri);
    request.headers.addAll(headers);

    final multipartFile = await http.MultipartFile.fromPath(
      fileKey,
      filePath,
      filename: path.basename(filePath),
    );
    request.files.add(multipartFile);

    final streamedResponse = await client.send(request).timeout(timeout);
    return await http.Response.fromStream(streamedResponse);
  }
}
