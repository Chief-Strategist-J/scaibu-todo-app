import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/auth/presentation/widget/customButton/auth_custom_button.style.dart';
import 'package:todo_app/feature/auth/presentation/widget/customButton/auth_custom_button.variant.dart';

class AuthCustomButton extends StatelessWidget {

  const AuthCustomButton({
    super.key,
    this.variant = AuthCustomButtonVariant.primary,
    required this.text,
    required this.onPress,
  });

  final AuthCustomButtonVariant variant;
  final String text;
  final VoidCallback? onPress;

  @override
  Widget build(final BuildContext context) {
    final AuthCustomButtonStyle style = AuthCustomButtonStyle(variant: variant);

    return PressableBox(
      onPress: onPress,
      style: style.button(context),
      child: StyledText(text, style: style.button(context)),
    );
  }
}
