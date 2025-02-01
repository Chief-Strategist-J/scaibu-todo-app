import 'package:todo_app/core/app_library.dart';

/// Doc Required
class TodoListItemComponentStyle {
  /// Doc Required
  TodoListItemComponentStyle({required this.variant});

  /// Doc Required
  final TodoListItemComponentVariant variant;

  /// Doc Required
  Style style(
    final BuildContext context, {
    final double fontSize = 16,
    final FontWeight fontWeight = FontWeight.bold,
  }) =>
      Style(
        $box.margin.top(6),
        $box.margin.bottom(6),
        $box.margin.left(4),
        $box.margin.right(4),
        $box.padding.all(16),
        $box.decoration.borderRadius.circular(16),
        $box.shadow.blurRadius(5),
        $box.shadow.spreadRadius(1),
        $box.color(context.primaryColor),
        $box.shadow.color(shadowColor),
        $text.style.fontWeight(fontWeight),
        $text.style.fontSize(fontSize),
        $text.style.color(textPrimaryColor),
      ).applyVariants(<Variant>[variant]);

  /// Doc Required
  Style columnStyleOfStartMin(final BuildContext context) => Style(
        $flex.crossAxisAlignment.start(),
        $flex.mainAxisSize.min(),
        $flex.gap(4),
      ).applyVariants(<Variant>[variant]);

  /// Doc Required
  Style rawStyleOfStartMin(
    final BuildContext context, {
    final double sizeBetweenChildren = 8,
  }) =>
      Style(
        $flex.mainAxisSize.min(),
        $flex.gap(sizeBetweenChildren),
      ).applyVariants(<Variant>[variant]);
}
