import 'package:todo_app/core/app_library.dart';

class IconButtonComponent extends StatelessWidget {
  final IconButtonComponentData data;
  final TaskDetailComponentVariantStyle style;
  final ManageTodoPageParam localTodoData;

  const IconButtonComponent({
    super.key,
    required this.data,
    required this.style,
    required this.localTodoData,
  });

  @override
  Widget build(BuildContext context) {
    return PressableBox(
      style: style.buttonStyle(context),
      onPress: data.onTap,
      child: ButtonUIComponent(data: data, localTodoData: localTodoData),
    );
  }
}

class ButtonUIComponent extends StatelessWidget {
  final IconButtonComponentData data;
  final ManageTodoPageParam localTodoData;

  const ButtonUIComponent({
    super.key,
    required this.data,
    required this.localTodoData,
  });

  PriorityModel _getSelectedPriority(BuildContext context) {
    return context.select((TaskDetailBloc value) {
          final state = value.state;
          return state is TaskDetailDataState ? state.priority : null;
        }) ??
        priorityList.firstWhere(
          (p) => p.code == localTodoData.priority,
          orElse: () => PriorityModel(title: 'No Priority', code: 'no_priority', color: slateGray),
        );
  }

  @override
  Widget build(BuildContext context) {
    Color? color;
    String? text;
    String? icon = data.icon;

    if (data.text == "Priority") {
      final selectedPriority = _getSelectedPriority(context);
      color = selectedPriority.color;
      text = selectedPriority.title;
      icon = Assets.iconIcFilledFlag;
    } else if (data.text == "Pomodoro") {
      text = "Pomodoro ${data.prefixText ?? ''}";
    }

    color ??= blackColor;

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          child: SvgPicture.asset(icon, height: 32, width: 32, fit: BoxFit.fitWidth, colorFilter: ColorFilter.mode(color, BlendMode.srcIn)),
        ),
        const SizedBox(height: 8),
        Text(text ?? data.text, style: boldTextStyle(size: 10, color: color)),
      ],
    );
  }
}
