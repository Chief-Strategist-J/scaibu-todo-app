import 'package:todo_app/core/app_library.dart';

/// Represents the application's theme data configuration.
class AppThemeData {
  static InputBorder get _getInputBoarder => OutlineInputBorder(
        gapPadding: 16,
        borderRadius: BorderRadius.circular(23),
        borderSide: _borderSide,
      );

  static BorderSide get _borderSide => BorderSide(
        color: cardColor.withOpacity(0.3),
      );

  /// Provides a custom decoration for input fields with an underline border.
  static InputDecoration underLineInputBoarderDecoration(
    final BuildContext context, {
    final String? hintText,
  }) =>
      InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        filled: true,
        fillColor: fillColor,
        hintText: hintText,
        hintStyle: primaryTextStyle(size: 20, color: secondaryTextColor),
        border: UnderlineInputBorder(borderSide: _borderSide),
        enabledBorder: UnderlineInputBorder(borderSide: _borderSide),
        disabledBorder: UnderlineInputBorder(borderSide: _borderSide),
        errorBorder: UnderlineInputBorder(borderSide: _borderSide),
        focusedBorder: UnderlineInputBorder(borderSide: _borderSide),
        focusedErrorBorder: UnderlineInputBorder(borderSide: _borderSide),
      );

  /// Provides custom Checkbox theme data.
  static CheckboxThemeData get checkboxThemeData => const CheckboxThemeData(
        shape: CircleBorder(),
        side: BorderSide(width: 0.5),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      );

  /// Provides custom AppBar theme data with a primary color.
  static AppBarTheme get appBarTheme => const AppBarTheme(
        color: primaryColor,
      );

  /// Provides custom light theme data.
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        timePickerTheme: const TimePickerThemeData(),
        primaryColor: primaryColor,
        cardColor: cardColor,
        scaffoldBackgroundColor: primaryColor,
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
          errorBorder: _getInputBoarder,
          border: _getInputBoarder,
          disabledBorder: _getInputBoarder,
        ),
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      );
}

/// Returns a fade transition for page navigation.
class MyTransitions {
  /// Returns a fade transition for page navigation.
  static void fadeTransition(final Widget page) =>
      PageRouteBuilder<FadeTransition>(
        pageBuilder: (
          final BuildContext context,
          final Animation<double> animation,
          final Animation<double> secondaryAnimation,
        ) =>
            page,
        transitionsBuilder: (
          final BuildContext context,
          final Animation<double> animation,
          final Animation<double> secondaryAnimation,
          final Widget child,
        ) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
      );
}

/// Custom route that applies a fade transition when navigating to a new page.
class FadePageRoute<T> extends PageRouteBuilder<T> {
  /// Constructor for `FadePageRoute`, initializes with a page builder.
  FadePageRoute({required this.builder})
      : super(
          pageBuilder: (
            final BuildContext context,
            final Animation<double> animation,
            final Animation<double> secondaryAnimation,
          ) =>
              builder(context),
          transitionsBuilder: (
            final BuildContext context,
            final Animation<double> animation,
            final Animation<double> secondaryAnimation,
            final Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );

  /// A builder function to create the page widget for this route.
  final WidgetBuilder builder;
}

/// Constructor for `CustomPageRoute`, initializes with a page builder,
/// transition duration, and animation curve.
class CustomPageRoute<T> extends PageRouteBuilder<T> {
  /// Constructor for `CustomPageRoute`, initializes with a page builder,
  /// transition duration, and animation curve.
  CustomPageRoute({
    required this.builder,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.ease,
    super.opaque = true,
  }) : super(
          pageBuilder: (
            final BuildContext context,
            final Animation<double> animation,
            final Animation<double> secondaryAnimation,
          ) =>
              builder(context),
          transitionDuration: duration,
          transitionsBuilder: (
            final BuildContext context,
            final Animation<double> animation,
            final Animation<double> secondaryAnimation,
            final Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );

  /// The builder for creating the page widget during navigation.
  final WidgetBuilder builder;

  /// The duration for the page transition animation.
  final Duration duration;

  /// The curve used to animate the page transition.
  final Curve curve;
}
