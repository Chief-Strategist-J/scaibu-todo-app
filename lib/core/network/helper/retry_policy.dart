import 'dart:math' as math;

import 'package:todo_app/core/app_library.dart';

/// A class that defines retry policies for handling request failures.
class RetryPolicy {
  /// A set of HTTP status codes that should trigger a retry.
  final Set<int> _retryableStatusCodes = <int>{408, 429, 500, 502, 503, 504};

  /// Gets the delay for the given attempt using exponential backoff.
  Duration getDelayForAttempt(final int attempt) =>
      Duration(milliseconds: math.pow(2, attempt).toInt() * 100);

  /// Determines whether the error should trigger a retry.
  bool shouldRetry(final dynamic error, final int attempt) {
    if (error is TimeoutException) {
      return true;
    }
    if (error is SocketException) {
      return true;
    }
    if (error is ApiException) {
      return _retryableStatusCodes.contains(error.statusCode);
    }
    return false;
  }

  /// Waits for the delay before retrying the request.
  Future<void> waitBeforeRetry(final int attempt) =>
      Future<void>.delayed(getDelayForAttempt(attempt));
}
