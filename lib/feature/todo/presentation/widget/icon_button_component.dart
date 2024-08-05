import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/todo/presentation/widget/taskDetailComponent/model/Icon_button_component_data.dart';

class IconButtonComponent extends StatelessWidget {
  final IconButtonComponentData _data;
  final TaskDetailComponentVariantStyle _style;

  const IconButtonComponent({
    super.key,
    required IconButtonComponentData data,
    required TaskDetailComponentVariantStyle style,
  })  : _style = style,
        _data = data;

  @override
  Widget build(BuildContext context) {
    final child = (null == _data.prefixText) ? ButtonUIComponent(data: _data) : ButtonUIWithPrefixTextComponent(data: _data);

    return PressableBox(
      style: _style.buttonStyle(context),
      onPress: _data.onTap,
      child: child,
    );
  }
}

class ButtonUIWithPrefixTextComponent extends StatelessWidget {
  final IconButtonComponentData _data;

  const ButtonUIWithPrefixTextComponent({super.key, required IconButtonComponentData data}) : _data = data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 0,
          top: 0,
          child: Text("${_data.prefixText}", style: boldTextStyle(color: redColor)),
        ),
        ButtonUIComponent(data: _data),
      ],
    );
  }
}

class ButtonUIComponent extends StatelessWidget {
  final IconButtonComponentData data;

  const ButtonUIComponent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          child: SvgPicture.asset(data.icon, height: 32, width: 32, fit: BoxFit.fitWidth),
        ),
        8.height,
        Text(data.text, style: boldTextStyle(size: 10)),
      ],
    );
  }
}
