import 'dart:math' as math;

import 'package:todo_app/core/app_library.dart';

class RetryPolicy {
  final Set<int> _retryableStatusCodes = {408, 429, 500, 502, 503, 504};

  Duration getDelayForAttempt(final int attempt) =>
      Duration(milliseconds: math.pow(2, attempt).toInt() * 100);

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

  Future<void> waitBeforeRetry(final int attempt) =>
      Future<void>.delayed(getDelayForAttempt(attempt));
}
