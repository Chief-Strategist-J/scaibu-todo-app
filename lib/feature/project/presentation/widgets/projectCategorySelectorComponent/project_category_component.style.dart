import 'package:todo_app/core/app_library.dart';

/// Doc Required
class ProjectCategoryComponentVariantStyle {
  /// Doc Required
  ProjectCategoryComponentVariantStyle({
    required final ProjectCategoryComponentVariant variant,
  }) : _variant = variant;
  final ProjectCategoryComponentVariant _variant;

  /// Doc Required
  Style rowStyle(final BuildContext context, {
    final double fontSize = 14,
    final FontWeight fontWeight = FontWeight.bold,
  }) =>
      Style().applyVariants(<Variant>[_variant]);

  /// Doc Required
  Style dialogStyle(final BuildContext context) =>
      Style(
        $box.width(context.width()),
        $box.padding(16),
      ).applyVariants(<Variant>[_variant]);

  /// Doc Required
  Style buttonStyle(final BuildContext context) =>
      Style(
        $box.borderRadius.circular(8),
        $box.padding.all(16),
      $on.press($box.color.grey.shade200()),
      ).applyVariants(<Variant>[_variant]);

  /// Doc Required
  Style taskPriority() => Style(
        $box.padding(8),
        $flex.crossAxisAlignment.center(),
      ).applyVariants(<Variant>[_variant]);
}
