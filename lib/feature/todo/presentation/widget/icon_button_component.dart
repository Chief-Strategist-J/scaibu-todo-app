import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/todo/presentation/widget/taskDetailComponent/model/priority_model.dart';

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
          child: Text("${_data.prefixText}", style: boldTextStyle(color: steelBlue)),
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
    final Color? color;
    final String? text;
    final String? icon;

    if (data.text == "Priority") {
      final PriorityModel? priority = context.select(
        (TaskDetailBloc value) {
          final state = value.state;
          if (state is TaskDetailDataState) {
            return state.priority;
          } else {
            return null;
          }
        },
      );

      color = priority?.color;
      text = priority?.title;
      icon = Assets.iconIcFilledFlag;
    } else {
      color = null;
      text = null;
      icon = null;
    }

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          child: SvgPicture.asset(
            icon ?? data.icon,
            height: 32,
            width: 32,
            fit: BoxFit.fitWidth,
            color: color,
          ),
        ),
        8.height,
        Text(
          text ?? data.text,
          style: boldTextStyle(size: 10, color: color),
        ),
      ],
    );
  }
}
