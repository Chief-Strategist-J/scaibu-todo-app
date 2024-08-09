import 'package:todo_app/core/app_library.dart';

class TaskDetailComponentVariantStyle {
  final TaskDetailComponentVariant _variant;

  TaskDetailComponentVariantStyle({required TaskDetailComponentVariant variant}) : _variant = variant;

  Style rowStyle(
    BuildContext context, {
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.bold,
  }) {
    return Style().applyVariants([_variant]);
  }

  Style dialogStyle(BuildContext context) {
    return Style(
      $box.width(context.width()),
      $box.padding(16),
    ).applyVariants([_variant]);
  }

  Style buttonStyle(BuildContext context) {
    return Style(
      $box.borderRadius.circular(8),
      $box.padding.all(16),
      $on.press($box.color.grey.shade200()),
    ).applyVariants([_variant]);
  }

  Style taskPriority() {
    return Style(
      $box.padding(8),
      $flex.crossAxisAlignment.center(),
    ).applyVariants([_variant]);
  }
}
