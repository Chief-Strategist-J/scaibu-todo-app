import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/core/network/helper/request_metrics.dart';
import 'package:todo_app/core/network/model/request_model.dart';

class Logger {
  static const String _tag = 'RestAPI';

  void logRequest(RequestModel request, Response response, RequestMetrics metrics) {
    final buffer = StringBuffer()
      ..writeln('┌── Request ──────────────────────────')
      ..writeln('│ URL: ${request.url}')
      ..writeln('│ Method: ${request.type}')
      ..writeln('│ Headers: ${_sanitizeHeaders(request.headers)}')
      ..writeln('│ Body: ${_truncateBody(request.body)}')
      ..writeln('├── Response ─────────────────────────')
      ..writeln('│ Status: ${response.statusCode}')
      ..writeln('│ Headers: ${_sanitizeHeaders(response.headers)}')
      ..writeln('│ Body: ${_truncateBody(response.body)}')
      ..writeln('├── Metrics ──────────────────────────')
      ..writeln('│ Total Duration: ${metrics.totalDuration.inMilliseconds}ms')
      ..writeln('│ Attempts: ${metrics.attemptDurations.length}')
      ..writeln('│ Average Attempt: ${metrics.averageAttemptDuration.toStringAsFixed(2)}ms')
      ..writeln('└────────────────────────────────────');

    log(
      buffer.toString(),
      name: _tag,
      time: DateTime.now(),
    );
  }

  void logError(RequestModel request, dynamic error, StackTrace stackTrace, RequestMetrics metrics) {
    final buffer = StringBuffer()
      ..writeln('┌── Error ───────────────────────────')
      ..writeln('│ URL: ${request.url}')
      ..writeln('│ Method: ${request.type}')
      ..writeln('│ Error: $error')
      ..writeln('├── Metrics ──────────────────────────')
      ..writeln('│ Attempts: ${metrics.attemptDurations.length}')
      ..writeln('│ Total Duration: ${metrics.totalDuration.inMilliseconds}ms')
      ..writeln('└────────────────────────────────────');

    log(
      buffer.toString(),
      name: _tag,
      error: error,
      stackTrace: stackTrace,
      time: DateTime.now(),
    );
  }

  String _sanitizeHeaders(Map<String, dynamic> headers) {
    final sanitized = Map<String, dynamic>.from(headers);
    if (sanitized.containsKey('authorization')) {
      sanitized['authorization'] = '********';
    }
    return sanitized.toString();
  }

  String _truncateBody(dynamic body) {
    const maxLength = 1000;
    final stringBody = body.toString();
    if (stringBody.length <= maxLength) return stringBody;
    return '${stringBody.substring(0, maxLength)}... (truncated)';
  }
}
