import 'package:todo_app/utils/library.dart';

class TodoThemeData {
  static Color lightPrimaryColor = Colors.white;
  static Color dartPrimaryColor = Colors.black;

  static ThemeData get lightThemeData {
    return ThemeData(
      useMaterial3: true,
      primaryColor: lightPrimaryColor,
      appBarTheme: AppBarTheme(
        color: Colors.white,
      ),
    );
  }

  static ThemeData get dartThemeData {
    return ThemeData(
      useMaterial3: true,
      primaryColor: dartPrimaryColor,
      appBarTheme: AppBarTheme(
        color: Colors.black,
      ),
    );
  }
}
