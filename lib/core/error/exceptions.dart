/// Exception thrown when attempting to access empty cache data.
class EmptyCacheException implements Exception {
  final String message;

  EmptyCacheException([this.message = 'Cache is empty.']);

  @override
  String toString() => 'EmptyCacheException: $message';
}

class CacheRefreshException implements Exception {
  final String message;

  CacheRefreshException([this.message = 'Cannot refresh empty cache.']);

  @override
  String toString() => 'CacheRefreshException: $message';
}

class ResponseParseException implements Exception {
  final String message;
  final String responseBody;
  final dynamic cause;

  ResponseParseException(this.message, this.responseBody, [this.cause]);

  @override
  String toString() => 'ResponseParseException: $message';
}

class MaxRetriesException implements Exception {
  final String message;
  final List<dynamic> errors;

  MaxRetriesException(this.message, this.errors);

  @override
  String toString() =>
      'MaxRetriesException: $message (${errors.length} failures)';
}

class InvalidUrlException implements Exception {
  final String message;
  final dynamic cause;

  InvalidUrlException(this.message, [this.cause]);

  @override
  String toString() =>
      'InvalidUrlException: $message${cause != null ? ' ($cause)' : ''}';
}

class NetworkException implements Exception {
  final String message;

  const NetworkException(this.message);

  @override
  String toString() => 'NetworkException: $message';
}

/// Custom exceptions
class ApiException implements Exception {
  final int statusCode;
  final String message;
  final dynamic data;

  ApiException(this.statusCode, this.message, [this.data]);

  factory ApiException.fromJson(int statusCode, Map<String, dynamic> json) {
    return ApiException(
      statusCode,
      json['message'] ?? 'Unknown error',
      json['data'],
    );
  }

  @override
  String toString() => 'ApiException: [$statusCode] $message';
}

class FileNotFoundException implements Exception {
  final String message;

  FileNotFoundException(this.message);
}
