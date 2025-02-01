import 'package:todo_app/core/app_library.dart';

/// Doc Required
class ProjectItemComponentStyle {
  /// Doc Required
  ProjectItemComponentStyle(this.variant);

  /// Doc Required
  final ProjectItemComponentVariant variant;

  /// Doc Required
  Style containerStyle(final BuildContext context) {
    Color backgroundColor = Colors.white;
    final List<BoxShadow> boxShadow = <BoxShadow>[];
    Gradient? gradient;

    switch (variant) {
      case ProjectItemComponentVariant.highlighted:
        backgroundColor = Colors.blue[50]!;
        boxShadow.add(
          const BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        );

      case ProjectItemComponentVariant.dark:
        backgroundColor = Colors.grey[850]!;

      case ProjectItemComponentVariant.flat:
        backgroundColor = Colors.transparent;

      case ProjectItemComponentVariant.basic:
    }

    return Style(
      $box.padding.all(16),
      $box.borderRadius.circular(16),
      $box.decoration(
        color: backgroundColor,
        gradient: gradient,
        boxShadow: boxShadow,
      ),
    );
  }

  /// Doc Required
  TextStyle titleStyle() => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: variant == ProjectItemComponentVariant.dark
            ? Colors.white
            : Colors.black,
      );

  /// Doc Required
  TextStyle descriptionStyle() => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: variant == ProjectItemComponentVariant.dark
            ? Colors.white70
            : Colors.black87,
      );
}
