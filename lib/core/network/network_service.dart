import 'package:http/http.dart' as http;
import 'package:todo_app/core/app_library.dart';

/// HTTP request methods for API requests
enum HttpRequestMethod {
  /// HTTP GET method for retrieving data
  get,

  /// HTTP POST method for sending data
  post,

  /// HTTP PUT method for updating data
  put,

  /// HTTP PATCH method for partially updating data
  patch,

  /// HTTP DELETE method for deleting data
  delete,

  /// HTTP method for uploading files
  upload,

  /// HTTP method for downloading files
  download,
}

/// RestApiImpl instance for making API calls
RestApiImpl restApi = RestApiImpl(
  baseUrl: baseUrl,
  userCredentials: userCredentials,
);

/// Extension for HTTP status codes to check if the response is successful
extension StatusCodeExtension on int {
  /// Extension for HTTP status codes to check if the response is successful
  bool isSuccessful() => this >= 200 && this < 300;
}

/// Implements the RestApi interface to handle HTTP requests and responses

class RestApiImpl implements RestApi {
  /// Constructs a RestApiImpl instance with the provided
  /// base URL and user credentials
  RestApiImpl({
    required this.baseUrl,
    required this.userCredentials,
    final http.Client? httpClient,
    final RequestQueue? requestQueue,
    final TokenManager? tokenManager,
    final NetworkMonitor? networkMonitor,
    final RetryPolicy? retryPolicy,
    final Logger? logger,
  })  : _httpClient = httpClient ?? http.Client(),
        _requestQueue = requestQueue ??
            RequestQueue(
              maxConcurrent: _maxConcurrentRequests,
              requestsPerMinute: _maxRequestsPerMinute,
            ),
        _tokenManager = tokenManager ?? TokenManager(),
        _networkMonitor = networkMonitor ?? NetworkMonitor(),
        _retryPolicy = retryPolicy ?? RetryPolicy(),
        _logger = logger ?? Logger();

  static const Duration _defaultTimeout = Duration(seconds: 30);
  static const Duration _uploadTimeout = Duration(minutes: 2);
  static const int _maxConcurrentRequests = 10;
  static const int _maxRequestsPerMinute = 100;

  /// The base URL for the API requests
  final String baseUrl;

  /// The user credentials for authenticating API requests
  final UserCredentials userCredentials;

  final http.Client _httpClient;
  final RequestQueue _requestQueue;
  final TokenManager _tokenManager;
  final NetworkMonitor _networkMonitor;
  final RetryPolicy _retryPolicy;
  final Logger _logger;

  @override
  Future<T> request<T>({
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
  }) async {
    if (!await _networkMonitor.isNetworkAvailable()) {
      throw const NetworkException('No network connection available');
    }
    final String fullUrl = _createFullUrl(endPoint);

    final RequestModel request = RequestModel(
      type: type,
      url: fullUrl,
      headers: await _createHeaders(headers),
      body: requestBody,
      uploadKey: uploadKey,
      uploadFilePath: uploadFilePath,
      timeout: timeout ?? _getDefaultTimeout(type),
      maxRetries: maxRetries,
      responseType: responseType,
      onStatusCodeError: onStatusCodeError,
    );

    return _requestQueue.enqueue(() => _executeRequest<T>(request));
  }

  Future<T> _executeRequest<T>(final RequestModel request) async {
    final RequestMetrics metrics = RequestMetrics();
    int attempts = 0;

    while (attempts < request.maxRetries) {
      try {
        metrics.startAttempt();
        final http.Response response = await _sendRequest(request);
        metrics.endAttempt();

        await _logger.logRequest(request, response, metrics);

        return await processResponse<T>(
          response,
          request.responseType,
          request.onStatusCodeError,
        );
      } catch (error, stackTrace) {
        metrics.recordError(error);

        if (!_retryPolicy.shouldRetry(error, attempts)) {
          await _logger.logError(request, error, stackTrace, metrics);
          rethrow;
        }

        attempts++;
        await _retryPolicy.waitBeforeRetry(attempts);
      }
    }

    throw MaxRetriesException(
      'Max retry attempts (${request.maxRetries}) exceeded',
      metrics.errors,
    );
  }

  Future<Response> _sendRequest(final RequestModel request) async {
    final Uri uri = Uri.parse(request.url);

    switch (request.type) {
      case HttpRequestMethod.get:
        return _httpClient
            .get(uri, headers: request.headers)
            .timeout(request.timeout);

      case HttpRequestMethod.post:
      case HttpRequestMethod.put:
      case HttpRequestMethod.patch:
      case HttpRequestMethod.delete:
        return _sendBodyRequest(request);

      case HttpRequestMethod.upload:
        return _handleUpload(request);

      case HttpRequestMethod.download:
        return _handleDownload(request);
    }
  }

  Future<Response> _sendBodyRequest(final RequestModel request) async {
    final String encodedBody = jsonEncode(request.body);
    final String method = request.type.toString().split('.').last.toUpperCase();

    return _httpClient.sendRequest(
      method,
      request.url,
      body: encodedBody,
      headers: request.headers,
      timeout: request.timeout,
    );
  }

  Future<http.Response> _handleUpload(final RequestModel request) async {
    final FileUploader uploader = FileUploader(client: _httpClient);
    return uploader.uploadFile(
      url: request.url,
      filePath: request.uploadFilePath,
      fileKey: request.uploadKey,
      headers: request.headers,
      timeout: request.timeout,
    );
  }

  Future<http.Response> _handleDownload(final RequestModel request) async {
    final FileDownloader downloader = FileDownloader(client: _httpClient);
    return downloader.downloadFile(
      url: request.url,
      headers: request.headers,
      timeout: request.timeout,
    );
  }

  @override
  Future<T> handleResponse<T>({
    required final Response response,
    final HttpResponseType responseType = HttpResponseType.JSON,
    final void Function(int)? onStatusCodeError,
  }) async {
    if (!_isSuccessfulResponse(response)) {
      _handleErrorResponse(response, onStatusCodeError);
    }

    return _parseResponse<T>(response, responseType);
  }

  Future<Map<String, String>> _createHeaders(
    final Map<String, String>? additionalHeaders,
  ) async {
    final String? token = await _tokenManager.getToken(userCredentials);

    final Map<String, String> headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
      if (token != null) HttpHeaders.authorizationHeader: token,
      ...?additionalHeaders,
    };

    return headers;
  }

  String _createFullUrl(final String endPoint) {
    try {
      return endPoint.startsWith('http') ? endPoint : '$baseUrl$endPoint';
    } on FormatException catch (e) {
      throw InvalidUrlException('Invalid URL format: $endPoint', e);
    }
  }

  Duration _getDefaultTimeout(final HttpRequestMethod type) => switch (type) {
        HttpRequestMethod.upload ||
        HttpRequestMethod.download =>
          _uploadTimeout,
        _ => _defaultTimeout
      };

  T _parseResponse<T>(
    final Response response,
    final HttpResponseType responseType,
  ) {
    if (response.body.isEmpty && T == dynamic) {
      return null as T;
    }

    try {
      switch (responseType) {
        case HttpResponseType.JSON:
          return jsonDecode(response.body) as T;
        case HttpResponseType.STRING:
          return response.body as T;
        case HttpResponseType.BODY_BYTES:
          return response.bodyBytes as T;
        case HttpResponseType.FULL_RESPONSE:
          return response as T;
      }
    } catch (e) {
      throw ResponseParseException(
        'Failed to parse response as $T',
        response.body,
        e,
      );
    }
  }

  bool _isSuccessfulResponse(final Response response) =>
      (response.statusCode >= 200) && (response.statusCode < 300);

  void _handleErrorResponse(
    final Response response,
    final void Function(int)? onStatusCodeError,
  ) {
    final int statusCode = response.statusCode;
    onStatusCodeError?.call(statusCode);

    if (response.body.isNotEmpty && _isJsonResponse(response)) {
      throw ApiException.fromJson(
        statusCode,
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    }

    throw ApiException(statusCode, 'Request failed with status: $statusCode');
  }

  bool _isJsonResponse(final Response response) {
    final String? contentType = response.headers['content-type'];
    return contentType?.contains('application/json') ?? false;
  }
}

/// Prints the details of the API response
void printResponse(final Response response) {
  log('\n____________________________________________________\n');
  log('REQUEST URL --> ${response.request?.url}');
  log('REQUEST METHOD --> ${response.request?.method}');
  log('REQUEST HEADERS --> ${response.request?.headers}');
  log('RESPONSE HEADERS --> ${response.headers}');
  log('RESPONSE STATUS CODE --> ${response.statusCode}');
  log('RESPONSE REASON PHRASE --> ${response.reasonPhrase}');
  log('RESPONSE BODY --> ${response.body}');
  log('____________________________________________________\n\n\n');
}

/// Prints the details of the streamed response
void printLogMessage(final StreamedResponse response) {
  log('\n____________________________________________________\n');
  log('REQUEST URL --> ${response.request?.url}');
  log('REQUEST METHOD --> ${response.request?.method}');
  log('REQUEST HEADERS --> ${response.request?.headers}');
  log('RESPONSE HEADERS --> ${response.headers}');
  log('RESPONSE STATUS CODE --> ${response.statusCode}');
  log('RESPONSE REASON PHRASE --> ${response.reasonPhrase}');
  log('____________________________________________________\n\n\n');
}
