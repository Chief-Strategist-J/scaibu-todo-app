import 'package:todo_app/core/app_library.dart';

class Logger {
  static const String _tag = 'RestAPI';

  Future<void> logRequest(
    final RequestModel request,
    final Response response,
    final RequestMetrics metrics,
  ) async {
    final StringBuffer buffer = StringBuffer()
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
      ..writeln(
          '│ Average Attempt: ${metrics.averageAttemptDuration.toStringAsFixed(2)}ms')
      ..writeln('└────────────────────────────────────');

    log(
      buffer.toString(),
      name: _tag,
      time: DateTime.now(),
    );
  }

  Future<void> logError(final RequestModel request, final dynamic error,
      final StackTrace stackTrace, final RequestMetrics metrics) async {
    final StringBuffer buffer = StringBuffer()
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

  String _sanitizeHeaders(final Map<String, dynamic> headers) {
    final Map<String, dynamic> sanitized = Map<String, dynamic>.from(headers);
    if (sanitized.containsKey('authorization')) {
      sanitized['authorization'] = '********';
    }
    return sanitized.toString();
  }

  String _truncateBody(final dynamic body) {
    const int maxLength = 1000;
    final String stringBody = body.toString();

    if (stringBody.length <= maxLength) {
      return stringBody;
    }

    return '${stringBody.substring(0, maxLength)}... (truncated)';
  }
}
