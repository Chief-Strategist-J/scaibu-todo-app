import 'package:todo_app/core/app_library.dart';

/// Retrieves the instance of ParseService from the service locator.
ParseService parseService = getIt<ParseService>();

/// Parses the given value to an integer, returning defaultValue if invalid.
class ParseService {
  /// Parses [value] to an integer, returning [defaultValue] if invalid.
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
