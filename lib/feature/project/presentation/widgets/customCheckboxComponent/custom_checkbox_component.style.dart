import 'package:todo_app/core/app_library.dart';

/// Doc Required
class CustomCheckboxComponentStyle {
  /// Doc Required
  CustomCheckboxComponentStyle(this.variant);

  /// Doc Required
  final CustomCheckboxComponentVariant variant;

  /// Doc Required
  Style containerStyle(final BuildContext context) {
    Color backgroundColor = Colors.transparent;
    final List<BoxShadow> boxShadow = <BoxShadow>[];
    Gradient? gradient;

    /// TO-DO : make proper variant later
    switch (variant) {
      case CustomCheckboxComponentVariant.light:
        backgroundColor = Colors.white;
      case CustomCheckboxComponentVariant.dark:
        backgroundColor = Colors.grey[850]!;
      case CustomCheckboxComponentVariant.elevated:
        backgroundColor = Colors.blue[300]!;
        boxShadow.add(
          const BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        );
      case CustomCheckboxComponentVariant.flat:
    }

    return Style(
      $box.padding.vertical(4),
      $box.borderRadius.circular(4),
      $box.decoration(
        color: backgroundColor,
        gradient: gradient,
        boxShadow: boxShadow,
        image: null,
      ),
    );
  }

  /// Doc Required
  TextStyle titleStyle() => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: variant == CustomCheckboxComponentVariant.light
            ? Colors.black87
            : Colors.white,
      );
}
