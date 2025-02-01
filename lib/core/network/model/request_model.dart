import 'package:todo_app/core/app_library.dart';

/// A entity that encapsulates the details of a network request.
///
/// This class holds all the information needed to perform a network request,
/// including the request type, URL, headers, body, timeout, retries, and more.
///
/// Parameters:
/// - `type`: The HTTP method type (GET, POST, etc.).
/// - `url`: The URL of the endpoint to which the request will be made.
/// - `headers`: A map of headers to include in the request.
/// - `body`: The body of the request (optional, can be null).
/// - `uploadKey`: The key to associate the file upload
/// (for multipart requests).
/// - `uploadFilePath`:
/// The local file path for the file to be uploaded (if any).
/// - `timeout`: The timeout duration for the request.
/// - `maxRetries`: The maximum number of retry attempts if the request fails.
/// - `responseType`: The expected type of response.
/// - `onStatusCodeError`: An optional callback to handle specific status
/// code errors.
///
/// Example usage:
/// ```dart
/// final request = RequestModel(
///   type: 'POST',
///   url: 'https://api.example.com/data',
///   headers: {'Authorization': 'Bearer token'},
///   body: '{"key": "value"}',
///   uploadKey: 'file',
///   uploadFilePath: '/path/to/file',
///   timeout: Duration(seconds: 30),
///   maxRetries: 3,
///   responseType: ResponseType.json,
///   onStatusCodeError: (statusCode) {
///     // Handle error based on status code
///   },
/// );
/// ```
///
class RequestModel {
  /// Model for encapsulating request details,
  /// including method, headers, and more.

  RequestModel({
    required this.type,
    required this.url,
    required this.headers,
    required this.body,
    required this.uploadKey,
    required this.uploadFilePath,
    required this.timeout,
    required this.maxRetries,
    required this.responseType,
    this.onStatusCodeError,
  });

  /// HTTP request method (GET, POST, etc.)
  final HttpRequestMethod type;

  /// URL for the HTTP request
  final String url;

  /// Headers for the HTTP request
  final Map<String, String> headers;

  /// Body data for the HTTP request
  final Map<String, dynamic> body;

  /// Key for the file being uploaded
  final String uploadKey;

  /// File path of the file being uploaded
  final String uploadFilePath;

  /// Timeout duration for the HTTP request
  final Duration timeout;

  /// Maximum number of retries for the request
  final int maxRetries;

  /// Response type expected from the request
  final HttpResponseType responseType;

  /// Optional callback for handling status code errors
  final void Function(int)? onStatusCodeError;
}
