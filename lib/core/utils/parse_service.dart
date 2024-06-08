import 'package:todo_app/core/todo_library.dart';
ParseService parseService = getIt<ParseService>();

class ParseService {
  int parseToInt(dynamic value, {int defaultValue = -1}) {
    if (value == null) return defaultValue;

    if (value is int) return value;

    if (value is String) {
      final intValue = int.tryParse(value);
      if (intValue != null) return intValue;
    }
    return defaultValue;
  }
}
