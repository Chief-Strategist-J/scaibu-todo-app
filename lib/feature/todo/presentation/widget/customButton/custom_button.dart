import 'package:todo_app/core/app_library.dart';

class CustomButton extends StatelessWidget {
  final GestureTapCallback? _onTap;
  final String? _data;
  final CustomButtonVariant _variant;

  const CustomButton({
    super.key,
    void Function()? onTap,
    String? data,
    CustomButtonVariant variant = CustomButtonVariant.primary,
  })  : _variant = variant,
        _data = data,
        _onTap = onTap;

  @override
  Widget build(BuildContext context) {
    final style = CustomButtonStyle(variant: _variant);

    return PressableBox(
      onPress: _onTap,
      style: style.button(context),
      child: StyledText(_data ?? '', style: style.button(context)),
    );
  }
}
