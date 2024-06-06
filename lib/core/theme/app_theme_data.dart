import 'package:todo_app/core/todo_library.dart';

class AppThemeData {
  static const MaterialAccentColor cardColor = Colors.blueAccent;
  static final Color shadowColor = Colors.grey.withOpacity(0.5);

  static final defaultBoxShadow = BoxShadow(
    blurRadius: 5,
    spreadRadius: 1,
    color: AppThemeData.shadowColor,
  );

  static InputBorder get _getInputBoarder {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: cardColor.withOpacity(0.3),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      timePickerTheme: TimePickerThemeData(),
      primaryColor: white,
      cardColor: cardColor,
      scaffoldBackgroundColor: white,
      appBarTheme: AppBarTheme(
        color: white,
      ),
      inputDecorationTheme: InputDecorationTheme(
        focusColor: cardColor,
        enabledBorder: _getInputBoarder,
        focusedBorder: _getInputBoarder,
      ),
    );
  }
}
