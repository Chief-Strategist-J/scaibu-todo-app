import 'package:todo_app/core/todo_library.dart';

class CustomButtonStyle {
  final CustomButtonVariant variant;

  CustomButtonStyle({required this.variant});

  Style button(BuildContext context) {
    return Style(
      $box.padding.all(16),
      $box.margin.horizontal(16),
      $box.height(56),
      $box.alignment.center(),
      $box.decoration.color(context.cardColor),
      $box.decoration.borderRadius.circular(16),
      $text.style.color(context.primaryColor),
      $text.style.fontWeight.bold(),
      $text.style.fontSize(16),
    ).applyVariants([variant]);
  }
}
