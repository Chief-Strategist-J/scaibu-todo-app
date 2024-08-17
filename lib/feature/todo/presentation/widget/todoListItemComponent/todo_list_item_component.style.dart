import 'package:todo_app/core/app_library.dart';

class TodoListItemComponentStyle {
  final TodoListItemComponentVariant variant;

  TodoListItemComponentStyle({required this.variant});

  Style style(
    BuildContext context, {
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.bold,
  }) {
    return Style(
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
    ).applyVariants([variant]);
  }

  Style columnStyleOfStartMin(BuildContext context) {
    return Style(
      $flex.crossAxisAlignment.start(),
      $flex.mainAxisSize.min(),
      $flex.gap(4),
    ).applyVariants([variant]);
  }

  Style rawStyleOfStartMin(
    BuildContext context, {
    double sizeBetweenChildren = 8,
  }) {
    return Style(
      $flex.mainAxisSize.min(),
      $flex.gap(sizeBetweenChildren),
    ).applyVariants([variant]);
  }
}
