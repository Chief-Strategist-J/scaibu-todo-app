/// Exception thrown when attempting to access empty cache data.
class EmptyCacheException implements Exception {
  /// Message describing the error, defaulting to 'Cache is empty.'
  EmptyCacheException([this.message = 'Cache is empty.']);

  /// The message detailing the exception cause.
  final String message;

  @override
  String toString() => 'EmptyCacheException: $message';
}

/// Exception thrown when attempting to refresh an empty cache.
class CacheRefreshException implements Exception {
  /// Message describing the error, defaulting to 'Cannot refresh empty cache.'
  CacheRefreshException([this.message = 'Cannot refresh empty cache.']);

  /// The message detailing the exception cause.
  final String message;

  /// Converts the exception to a readable string format.
  @override
  String toString() => 'CacheRefreshException: $message';
}

/// Exception thrown when there is an error parsing a response.
class ResponseParseException implements Exception {
  /// Initializes the exception with a message, response body,
  /// and an optional cause.
  ResponseParseException(this.message, this.responseBody, [this.cause]);

  /// The message detailing the exception cause.
  final String message;

  /// The body of the response that failed to be parsed.
  final String responseBody;

  /// The cause of the exception, if available.
  final dynamic cause;

  /// Converts the exception to a readable string format.
  @override
  String toString() => 'ResponseParseException: $message';
}

/// Exception thrown when the maximum number of retries is reached.
class MaxRetriesException implements Exception {
  /// Initializes the exception with a message and a list of errors.
  MaxRetriesException(this.message, this.errors);

  /// The message detailing the exception cause.
  final String message;

  /// A list of errors that occurred during the retry attempts.
  final List<dynamic> errors;

  /// Converts the exception to a readable string format, including
  /// the number of failures.
  @override
  String toString() =>
      'MaxRetriesException: $message (${errors.length} failures)';
}

/// Exception thrown when an invalid URL is encountered.
class InvalidUrlException implements Exception {
  /// Initializes the exception with a message and an optional cause.
  InvalidUrlException(this.message, [this.cause]);

  /// The message detailing the exception cause.
  final String message;

  /// The cause of the exception, if available.
  final dynamic cause;

  /// Converts the exception to a readable string format, including the
  /// cause if present.
  @override
  String toString() =>
      'InvalidUrlException: $message${cause != null ? ' ($cause)' : ''}';
}

/// Exception thrown when a network-related error occurs.
class NetworkException implements Exception {
  /// Initializes the exception with a message.
  const NetworkException(this.message);

  /// The message detailing the exception cause.
  final String message;

  /// Converts the exception to a readable string format.
  @override
  String toString() => 'NetworkException: $message';
}

/// Exception thrown for API-related errors, including status code and message.
class ApiException implements Exception {
  /// Initializes the exception with a status code, message, and optional data.
  ApiException(this.statusCode, this.message, [this.data]);

  /// Factory constructor to create an ApiException from a JSON response.
  factory ApiException.fromJson(
    final int statusCode,
    final Map<String, dynamic> json,
  ) =>
      ApiException(
        statusCode,
        (json['message'] as String?) ?? 'Unknown error',
        json['data'],
      );

  /// The HTTP status code associated with the error.
  final int statusCode;

  /// The message detailing the exception cause.
  final String message;

  /// Optional data related to the exception, if available.
  final dynamic data;

  /// Converts the exception to a readable string
  /// format, including status code and message.
  @override
  String toString() => 'ApiException: [$statusCode] $message';
}

/// Exception thrown when a file is not found.
class FileNotFoundException implements Exception {
  /// Initializes the exception with a message.
  FileNotFoundException(this.message);

  /// The message detailing the exception cause.
  final String message;
}
