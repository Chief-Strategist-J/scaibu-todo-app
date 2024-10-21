import 'dart:math' as math;

import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/core/error/exceptions.dart';

class RetryPolicy {
  final Set<int> _retryableStatusCodes = {408, 429, 500, 502, 503, 504};

  Duration getDelayForAttempt(int attempt) {
    return Duration(milliseconds: math.pow(2, attempt).toInt() * 100);
  }

  bool shouldRetry(dynamic error, int attempt) {
    if (error is TimeoutException) return true;
    if (error is SocketException) return true;
    if (error is ApiException) {
      return _retryableStatusCodes.contains(error.statusCode);
    }
    return false;
  }

  Future<void> waitBeforeRetry(int attempt) {
    return Future.delayed(getDelayForAttempt(attempt));
  }
}
