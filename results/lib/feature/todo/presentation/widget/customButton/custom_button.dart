import 'package:todo_app/core/app_library.dart';

/// A customizable button widget supporting different variants,
/// tap actions, and label data.
class CustomButton extends StatelessWidget {
  /// Constructor
  const CustomButton({
    super.key,
    final void Function()? onTap,
    final String? data,
    final CustomButtonVariant variant = CustomButtonVariant.primary,
  })  : _variant = variant,
        _data = data,
        _onTap = onTap;

  final GestureTapCallback? _onTap;
  final String? _data;
  final CustomButtonVariant _variant;

  @override
  Widget build(final BuildContext context) {
    final CustomButtonStyle style = CustomButtonStyle(variant: _variant);

    return PressableBox(
      onPress: () {
        if (_onTap != null) {
          _onTap?.call();
        }
      },
      style: style.button(context),
      child: StyledText(_data ?? '', style: style.button(context)),
    );
  }
}
