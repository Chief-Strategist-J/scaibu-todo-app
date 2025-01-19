import 'package:todo_app/core/app_library.dart';

/// A service responsible for logging information, errors, and events.
LogService logService = getIt<LogService>();

/// Service for logging messages, errors, and debugging information.
class LogService {
  /// Reset the terminal text color to the default color.
  final String reset = '\x1B[0m';

  /// Red color for terminal text.
  final String red = '\x1B[31m';

  /// Yellow color for terminal text.
  final String yellow = '\x1B[33m';

  /// Blue color for terminal text.
  final String blue = '\x1B[34m';

  /// White color for terminal text.
  final String white = '\x1B[37m';

  /// Logs a crash report asynchronously.
  Future<void> crashLog({
    required final String errorMessage,
    required final dynamic e,
    final StackTrace? stack,
  }) async {
    final String? stackTraceString = stack?.toString();
    final String filteredStackTrace = _filterStackTrace(stackTraceString);
    final List<String> reversedStackTrace =
        _reverseStackTrace(filteredStackTrace);
    final String stackTrace = _formatStackTrace(reversedStackTrace);

    final String detailedErrorMessage =
        _errorMessage(errorMessage, e, stackTrace);

    debugPrint(detailedErrorMessage);

    final FirebaseCrashlytics crashlytics = FirebaseCrashlytics.instance;
    await crashlytics.log(errorMessage);
    await crashlytics.recordError(e, stack, printDetails: false);
  }

  String _errorMessage(
    final String errorMessage,
    final dynamic e,
    final String stackTrace,
  ) {
    final String detailedErrorMessage = '''
    ${red}Error: $yellow${errorMessage.toUpperCase()}$reset
    ${red}Exception: $blue${e.toString().toUpperCase()}$reset
    -----------------------------------------------------------------------------------
    ${red}Stack Trace: $white\n${stackTrace.toString()}$reset
    ''';
    return detailedErrorMessage;
  }

  String _filterStackTrace(final String? stackTraceString) =>
      stackTraceString
          ?.split('\n')
          .where(
            (final String line) =>
                !line.contains('<asynchronous suspension>') &&
                !line.contains('<anonymous closure>'),
          )
          .join('\n') ??
      '';

  List<String> _reverseStackTrace(final String stackTrace) =>
      stackTrace.split('\n').toList().reversed.toList();

  String _formatStackTrace(final List<String> reversedStackTrace) =>
      reversedStackTrace.map(_formatStackTraceLine).join('\n');

  String _formatStackTraceLine(final String line) {
    final RegExpMatch? match =
        RegExp(r'#\d+\s+(.+?)\s+\((.+?):(\d+):(\d+)\)').firstMatch(line);

    if (match != null) {
      final String? functionName = match.group(1);
      final String? libraryName = match.group(2);
      final String lineNumber = '${match.group(3)}:${match.group(4)}';

      return '''
    Function: $red$functionName$reset
    Library: $libraryName$reset
    Line number: $yellow$lineNumber$reset
''';
    }
    return line;
  }
}
