import 'package:todo_app/core/app_library.dart';

LogService logService = getIt<LogService>();

class LogService {
  final String reset = '\x1B[0m';
  final String red = '\x1B[31m';
  final String yellow = '\x1B[33m';
  final String blue = '\x1B[34m';
  final String white = '\x1B[37m';

  void crashLog({
    required String errorMessage,
    required dynamic e,
    StackTrace? stack,
  }) {

    final stackTraceString = stack?.toString();
    final filteredStackTrace = _filterStackTrace(stackTraceString);
    final reversedStackTrace = _reverseStackTrace(filteredStackTrace);
    final stackTrace = _formatStackTrace(reversedStackTrace);

    String detailedErrorMessage = _errorMessage(errorMessage, e, stackTrace);

    debugPrint(detailedErrorMessage);

    final crashlytics = FirebaseCrashlytics.instance;
    crashlytics.log(errorMessage);
    crashlytics.recordError(e, stack,printDetails: false);
  }

  String _errorMessage(String errorMessage, e, String stackTrace) {
    final detailedErrorMessage = '''
    ${red}Error: $yellow${errorMessage.toUpperCase()}$reset
    ${red}Exception: $blue${e.toString().toUpperCase()}$reset
    -----------------------------------------------------------------------------------
    ${red}Stack Trace: $white\n${stackTrace.toString()}$reset
    ''';
    return detailedErrorMessage;
  }

  String _filterStackTrace(String? stackTraceString) {
    return stackTraceString?.split('\n').where((line) => !line.contains('<asynchronous suspension>') && !line.contains('<anonymous closure>')).join('\n') ?? '';
  }

  List<String> _reverseStackTrace(String stackTrace) {
    return stackTrace.split('\n').toList().reversed.toList();
  }

  String _formatStackTrace(List<String> reversedStackTrace) {
    return reversedStackTrace.map((line) => _formatStackTraceLine(line)).join('\n');
  }

  String _formatStackTraceLine(String line) {
    final match = RegExp(r'#\d+\s+(.+?)\s+\((.+?):(\d+):(\d+)\)').firstMatch(line);

    if (match != null) {
      final functionName = match.group(1);
      final libraryName = match.group(2);
      final lineNumber = '${match.group(3)}:${match.group(4)}';

      return '''
    Function: $red$functionName$reset
    Library: $libraryName$reset
    Line number: $yellow$lineNumber$reset
''';
    }
    return line;
  }
}
