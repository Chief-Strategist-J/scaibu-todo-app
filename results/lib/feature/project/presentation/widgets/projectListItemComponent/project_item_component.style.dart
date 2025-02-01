import 'package:todo_app/core/app_library.dart';

import 'project_item_component.variant.dart';

class ProjectItemComponentStyle {
  final ProjectItemComponentVariant variant;

  ProjectItemComponentStyle(this.variant);

  Style containerStyle(BuildContext context) {
    Color backgroundColor;
    List<BoxShadow> boxShadow = [];
    Gradient? gradient;

    switch (variant) {
      case ProjectItemComponentVariant.highlighted:
        backgroundColor = Colors.blue[50]!;
        boxShadow.add(
          const BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2)),
        );
        break;

      case ProjectItemComponentVariant.dark:
        backgroundColor = Colors.grey[850]!;
        break;

      case ProjectItemComponentVariant.flat:
        backgroundColor = Colors.transparent;
        break;

      case ProjectItemComponentVariant.basic:
      default:
        backgroundColor = Colors.white;
        break;
    }

    return Style(
      $box.padding.all(16),
      $box.borderRadius.circular(16),
      $box.decoration(color: backgroundColor, gradient: gradient, boxShadow: boxShadow),
    );
  }

  TextStyle titleStyle() {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: variant == ProjectItemComponentVariant.dark ? Colors.white : Colors.black,
    );
  }

  TextStyle descriptionStyle() {
    return TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: variant == ProjectItemComponentVariant.dark ? Colors.white70 : Colors.black87,
    );
  }
}
