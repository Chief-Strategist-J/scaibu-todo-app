import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/auth/presentation/widget/customButton/auth_custom_button.style.dart';
import 'package:todo_app/feature/auth/presentation/widget/customButton/auth_custom_button.variant.dart';

/// Doc Required
class AuthCustomButton extends StatelessWidget {
  /// Doc Required
  const AuthCustomButton({
    required this.text,
    required this.onPress,
    super.key,
    this.variant = AuthCustomButtonVariant.primary,
  });

  /// Doc Required
  final AuthCustomButtonVariant variant;

  /// Doc Required
  final String text;

  /// Doc Required
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
