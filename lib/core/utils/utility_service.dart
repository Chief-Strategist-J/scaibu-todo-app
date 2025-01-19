import 'package:todo_app/core/app_library.dart';

/// UtilityService
class UtilityService {
  /// Converts a [String] color code to a [Color] object.
  Color stringToColor(final String colorString) =>
      Color(int.parse(colorString));
}
