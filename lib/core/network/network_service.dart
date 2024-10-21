import 'package:http/http.dart' as http;
import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/core/error/exceptions.dart';
import 'package:todo_app/core/network/extension/http_client_extension.dart';
import 'package:todo_app/core/network/extension/rest_api_impl_extension.dart';
import 'package:todo_app/core/network/helper/file_downloader.dart';
import 'package:todo_app/core/network/helper/file_uploader.dart';
import 'package:todo_app/core/network/helper/logger.dart';
import 'package:todo_app/core/network/helper/network_monitor.dart';
import 'package:todo_app/core/network/helper/request_metrics.dart';
import 'package:todo_app/core/network/helper/request_queue.dart';
import 'package:todo_app/core/network/helper/retry_policy.dart';
import 'package:todo_app/core/network/helper/token_manager.dart';
import 'package:todo_app/core/network/model/request_model.dart';

enum HttpRequestMethod {
  get,
  post,
  put,
  patch,
  delete,
  upload,
  download,
}

RestApiImpl restApi = RestApiImpl(baseUrl: baseUrl, userCredentials: userCredentials);

extension StatusCodeExtension on int {
  bool isSuccessful() => this >= 200 && this < 300;
}

class RestApiImpl implements RestApi {
  static const Duration _defaultTimeout = Duration(seconds: 30);
  static const Duration _uploadTimeout = Duration(minutes: 2);
  static const int _maxConcurrentRequests = 10;
  static const int _maxRequestsPerMinute = 100;

  final String baseUrl;
  final UserCredentials userCredentials;
  final http.Client _httpClient; // Changed from HttpClient to http.Client
  final RequestQueue _requestQueue;
  final TokenManager _tokenManager;
  final NetworkMonitor _networkMonitor;
  final RetryPolicy _retryPolicy;
  final Logger _logger;

  RestApiImpl({
    required this.baseUrl,
    required this.userCredentials,
    http.Client? httpClient,
    RequestQueue? requestQueue,
    TokenManager? tokenManager,
    NetworkMonitor? networkMonitor,
    RetryPolicy? retryPolicy,
    Logger? logger,
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

  @override
  Future<T> request<T>({
    HttpRequestMethod type = HttpRequestMethod.get,
    required String endPoint,
    Map<String, dynamic> requestBody = const {},
    Map<String, String>? headers,
    String uploadKey = '',
    String uploadFilePath = '',
    void Function(int)? onStatusCodeError,
    Duration? timeout,
    int maxRetries = 3,
    HttpResponseType responseType = HttpResponseType.JSON,
  }) async {
    if (!await _networkMonitor.isNetworkAvailable()) {
      throw const NetworkException('No network connection available');
    }
    final fullUrl = _createFullUrl(endPoint);

    final request = RequestModel(
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

  Future<T> _executeRequest<T>(RequestModel request) async {
    final metrics = RequestMetrics();
    var attempts = 0;

    while (attempts < request.maxRetries) {
      try {
        metrics.startAttempt();
        final response = await _sendRequest(request);
        metrics.endAttempt();

        _logger.logRequest(request, response, metrics);

        return await processResponse<T>(
          response,
          request.responseType,
          request.onStatusCodeError,
        );
      } catch (error, stackTrace) {
        metrics.recordError(error);

        if (!_retryPolicy.shouldRetry(error, attempts)) {
          _logger.logError(request, error, stackTrace, metrics);
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

  Future<Response> _sendRequest(RequestModel request) async {
    final uri = Uri.parse(request.url);

    switch (request.type) {
      case HttpRequestMethod.get:
        return _httpClient.get(uri, headers: request.headers).timeout(request.timeout);

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

  Future<Response> _sendBodyRequest(RequestModel request) async {
    final encodedBody = jsonEncode(request.body);
    final method = request.type.toString().split('.').last.toUpperCase();

    return _httpClient.sendRequest(
      method,
      request.url,
      body: encodedBody,
      headers: request.headers,
      timeout: request.timeout,
    );
  }

  Future<http.Response> _handleUpload(RequestModel request) async {
    final uploader = FileUploader(client: _httpClient);
    return uploader.uploadFile(
      url: request.url,
      filePath: request.uploadFilePath,
      fileKey: request.uploadKey,
      headers: request.headers,
      timeout: request.timeout,
    );
  }

  Future<http.Response> _handleDownload(RequestModel request) async {
    final downloader = FileDownloader(client: _httpClient);
    return downloader.downloadFile(
      url: request.url,
      headers: request.headers,
      timeout: request.timeout,
    );
  }

  @override
  Future<T> handleResponse<T>({
    required Response response,
    HttpResponseType responseType = HttpResponseType.JSON,
    void Function(int)? onStatusCodeError,
  }) async {
    if (!_isSuccessfulResponse(response)) {
      _handleErrorResponse(response, onStatusCodeError);
    }

    return _parseResponse<T>(response, responseType);
  }

  Future<Map<String, String>> _createHeaders(Map<String, String>? additionalHeaders) async {
    final token = await _tokenManager.getToken(userCredentials);

    final headers = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
      if (token != null) HttpHeaders.authorizationHeader: token,
      ...?additionalHeaders,
    };

    return headers;
  }

  String _createFullUrl(String endPoint) {
    try {
      return endPoint.startsWith('http') ? endPoint : '$baseUrl$endPoint';
    } on FormatException catch (e) {
      throw InvalidUrlException('Invalid URL format: $endPoint', e);
    }
  }

  Duration _getDefaultTimeout(HttpRequestMethod type) {
    switch (type) {
      case HttpRequestMethod.upload:
      case HttpRequestMethod.download:
        return _uploadTimeout;
      default:
        return _defaultTimeout;
    }
  }

  T _parseResponse<T>(Response response, HttpResponseType responseType) {
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

  bool _isSuccessfulResponse(Response response) {
    return response.statusCode >= 200 && response.statusCode < 300;
  }

  void _handleErrorResponse(Response response, void Function(int)? onStatusCodeError) {
    final statusCode = response.statusCode;
    onStatusCodeError?.call(statusCode);

    if (response.body.isNotEmpty && _isJsonResponse(response)) {
      throw ApiException.fromJson(statusCode, jsonDecode(response.body));
    }

    throw ApiException(statusCode, 'Request failed with status: $statusCode');
  }

  bool _isJsonResponse(Response response) {
    final contentType = response.headers['content-type'];
    return contentType?.contains('application/json') ?? false;
  }
}

void printResponse(Response response) {
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

void printLogMessage(StreamedResponse response) {
  log('\n____________________________________________________\n');
  log('REQUEST URL --> ${response.request?.url}');
  log('REQUEST METHOD --> ${response.request?.method}');
  log('REQUEST HEADERS --> ${response.request?.headers}');
  log('RESPONSE HEADERS --> ${response.headers}');
  log('RESPONSE STATUS CODE --> ${response.statusCode}');
  log('RESPONSE REASON PHRASE --> ${response.reasonPhrase}');
  log('____________________________________________________\n\n\n');
}
