import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/auth/presentation/widget/customButton/auth_custom_button.variant.dart';

class AuthCustomButtonStyle {

  AuthCustomButtonStyle({required this.variant});
  final AuthCustomButtonVariant variant;

  Style button(final BuildContext context) => Style(
      AuthCustomButtonVariant.primary(
        $box.padding.all(16),
        $box.height(56),
        $box.alignment.center(),
        $box.decoration.color(context.cardColor),
        $box.decoration.borderRadius.circular(60),
        $text.style.color(context.primaryColor),
        $text.style.fontWeight.bold(),
        $text.style.fontSize(14),
      ),
      AuthCustomButtonVariant.secondary(
        $box.padding.all(16),
        $box.height(90),
        $box.width(90),
        $box.alignment.center(),
        $box.decoration.color(context.cardColor),
        $box.decoration.borderRadius.circular(120),
        $text.style.color(context.primaryColor),
        $text.style.fontWeight.bold(),
        $text.style.fontSize(14),
      ),
    ).applyVariants(<Variant>[variant]);
}
