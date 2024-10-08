import 'package:todo_app/core/app_library.dart';

class CustomCheckboxComponentStyle {
  final CustomCheckboxComponentVariant variant;

  CustomCheckboxComponentStyle(this.variant);

  Style containerStyle(BuildContext context) {
    Color backgroundColor;
    List<BoxShadow> boxShadow = [];
    Gradient? gradient;

    /// TODO : make proper variant later
    switch (variant) {
      case CustomCheckboxComponentVariant.light:
        backgroundColor = Colors.white;
        break;
      case CustomCheckboxComponentVariant.dark:
        backgroundColor = Colors.grey[850]!;
        break;
      case CustomCheckboxComponentVariant.elevated:
        backgroundColor = Colors.blue[300]!;
        boxShadow.add(
          const BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        );
        break;
      case CustomCheckboxComponentVariant.flat:
      default:
        backgroundColor = Colors.transparent;
        break;
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

  TextStyle titleStyle() {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: variant == CustomCheckboxComponentVariant.light ? Colors.black87 : Colors.white,
    );
  }
}
