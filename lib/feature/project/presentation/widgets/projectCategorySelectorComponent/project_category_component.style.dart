import 'package:todo_app/core/app_library.dart';

class ProjectCategoryComponentVariantStyle {
  final ProjectCategoryComponentVariant _variant; // Assuming you have a variant class for project categories

  ProjectCategoryComponentVariantStyle({required ProjectCategoryComponentVariant variant}) : _variant = variant;

  Style rowStyle(
    BuildContext context, {
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.bold,
  }) {
    return Style().applyVariants([_variant]);
  }

  Style dialogStyle(BuildContext context) {
    return Style(
      $box.width(context.width()), // Full width of the screen
      $box.padding(16), // Padding around the dialog
    ).applyVariants([_variant]);
  }

  Style buttonStyle(BuildContext context) {
    return Style(
      $box.borderRadius.circular(8),
      $box.padding.all(16), // Padding for the button
      $on.press($box.color.grey.shade200()), // Pressed state style
    ).applyVariants([_variant]);
  }

  Style taskPriority() {
    return Style(
      $box.padding(8), // Padding for each task priority item
      $flex.crossAxisAlignment.center(), // Center alignment for the item
    ).applyVariants([_variant]);
  }
}
