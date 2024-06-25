import 'package:todo_app/core/app_library.dart';

class AppThemeData {
  static const MaterialAccentColor cardColor = Colors.blueAccent;
  static final Color shadowColor = Colors.grey.withOpacity(0.5);

  static InputBorder get _getInputBoarder {
    return OutlineInputBorder(
      gapPadding: 16,
      borderRadius: BorderRadius.circular(23),
      borderSide: BorderSide(
        color: cardColor.withOpacity(0.3),
      ),
    );
  }

  static CheckboxThemeData get checkboxThemeData {
    return const CheckboxThemeData(
      shape: CircleBorder(),
      side: BorderSide(width: 0.5),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  static AppBarTheme get appBarTheme {
    return const AppBarTheme(
      color: white,
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      timePickerTheme: const TimePickerThemeData(),
      primaryColor: white,
      cardColor: cardColor,
      scaffoldBackgroundColor: white,
      checkboxTheme: checkboxThemeData,
      appBarTheme: appBarTheme,
      inputDecorationTheme: InputDecorationTheme(
        focusColor: cardColor,
        filled: true,
        isDense: true,
        contentPadding: const EdgeInsets.all(16),
        fillColor: shadowColor.withOpacity(0.1),
        enabledBorder: _getInputBoarder,
        focusedBorder: _getInputBoarder,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}

class MyTransitions {
  static Route<dynamic> fadeTransition(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}

class FadePageRoute<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;

  FadePageRoute({required this.builder})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
            return builder(context);
          },
          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}

class CustomPageRoute<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;
  final Duration duration;
  final Curve curve;


  CustomPageRoute({
    required this.builder,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.ease,
    super.opaque = true,
  }) : super(
          pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => builder(context),
          transitionDuration: duration,
          transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },

        );
}
