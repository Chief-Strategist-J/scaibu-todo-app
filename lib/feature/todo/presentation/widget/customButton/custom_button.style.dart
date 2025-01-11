import 'package:todo_app/core/app_library.dart';

class CustomButtonStyle {
  final CustomButtonVariant variant;

  CustomButtonStyle({required this.variant});

  Style button(final BuildContext context) => Style(
        $box.padding.all(16),
        $box.margin.horizontal(8),
        $box.height(50),
        $box.alignment.center(),
        CustomButtonVariant.primary(
          $box.decoration.color(context.cardColor),
          $text.style.color(context.primaryColor),
        ),
        CustomButtonVariant.secondary(
          $box.decoration.color(context.primaryColor),
          $text.style.color(context.cardColor),
          $box.decoration.border.all(color: context.cardColor.withOpacity(0.5)),
        ),
        $box.decoration.borderRadius.circular(300),
        $text.style.fontWeight.bold(),
        $text.style.fontSize(16),
      ).applyVariants(<Variant>[variant]);
}
