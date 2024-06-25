import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/auth/presentation/widget/customButton/auth_custom_button.style.dart';
import 'package:todo_app/feature/auth/presentation/widget/customButton/auth_custom_button.variant.dart';

class AuthCustomButton extends StatelessWidget {
  final AuthCustomButtonVariant variant;
  final String text;
  final VoidCallback? onPress;

  const AuthCustomButton({
    super.key,
    this.variant = AuthCustomButtonVariant.primary,
    required this.text,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final style = AuthCustomButtonStyle(variant: variant);

    return PressableBox(
      onPress: onPress,
      style: style.button(context),
      child: StyledText(text, style: style.button(context)),
    );
  }
}
