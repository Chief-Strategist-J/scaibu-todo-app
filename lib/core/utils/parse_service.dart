import 'package:todo_app/core/app_library.dart';

ParseService parseService = getIt<ParseService>();

class ParseService {
  int parseToInt(final dynamic value, {final int defaultValue = -1}) {
    if (value == null) {
      return defaultValue;
    }

    if (value is int) {
      return value;
    }

    if (value is String) {
      final int? intValue = int.tryParse(value);
      if (intValue != null) {
        return intValue;
      }
    }
    return defaultValue;
  }
}
