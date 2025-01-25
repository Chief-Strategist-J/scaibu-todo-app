import 'package:todo_app/core/app_library.dart';

/// Doc Required
class IconButtonComponent extends StatelessWidget {
  /// Doc Required
  const IconButtonComponent({
    required final IconButtonComponentData data,
    required final TaskDetailComponentVariantStyle style,
    required final ManageTodoPageParam localTodoData,
    super.key,
  })  : _localTodoData = localTodoData,
        _style = style,
        _data = data;
  final IconButtonComponentData _data;
  final TaskDetailComponentVariantStyle _style;
  final ManageTodoPageParam _localTodoData;

  @override
  Widget build(final BuildContext context) => PressableBox(
        style: _style.buttonStyle(context),
        onPress: _data.onTap,
        child: ButtonUIComponent(data: _data, localTodoData: _localTodoData),
      );
}

/// Doc Required
class ButtonUIComponent extends StatelessWidget {
  /// Doc Required
  const ButtonUIComponent({
    required final IconButtonComponentData data,
    required final ManageTodoPageParam localTodoData,
    super.key,
  })  : _localTodoData = localTodoData,
        _data = data;

  final IconButtonComponentData _data;
  final ManageTodoPageParam _localTodoData;

  PriorityModel _getSelectedPriority(final BuildContext context) =>
      context.select((final TaskDetailBloc value) {
        final TaskDetailState state = value.state;
        return state is TaskDetailDataState ? state.priority : null;
      }) ??
      priorityList.firstWhere(
        (final PriorityModel p) => p.code == _localTodoData.priority,
        orElse: () => PriorityModel(
          title: 'No Priority',
          code: 'no_priority',
          color: slateGray,
        ),
      );

  @override
  Widget build(final BuildContext context) {
    Color? color;
    String? text;
    String? icon = _data.icon;

    if (_data.text == 'Priority') {
      final PriorityModel selectedPriority = _getSelectedPriority(context);
      color = selectedPriority.color;
      text = selectedPriority.title;
      icon = Assets.iconIcFilledFlag;
    } else if (_data.text == 'Pomodoro') {
      text = "Pomodoro ${_data.prefixText ?? ''}";
    }

    color ??= blackColor;

    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(8),
          child: SvgPicture.asset(
            icon,
            height: 32,
            width: 32,
            fit: BoxFit.fitWidth,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          ),
        ),
        const SizedBox(height: 8),
        Text(text ?? _data.text, style: boldTextStyle(size: 10, color: color)),
      ],
    );
  }
}
