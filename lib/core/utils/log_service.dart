import 'package:todo_app/core/todo_library.dart';

LogService logService = getIt<LogService>();

class LogService {
  void crashLog({required String errorMessage, dynamic e, required StackTrace stack}) {
    FlutterErrorDetails errorDetails = FlutterErrorDetails(exception: e, stack: stack);
    FlutterError.reportError(errorDetails);

    FirebaseCrashlytics.instance.log(errorMessage);
    FirebaseCrashlytics.instance.recordError(e, stack);

    log('\n____________________________________________________\n');
    debugPrint(errorMessage);
    log('\n____________________________________________________\n');
  }
}
