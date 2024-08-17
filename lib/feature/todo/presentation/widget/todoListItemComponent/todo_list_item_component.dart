import 'package:todo_app/core/app_library.dart';

class TodoListItemComponent extends HookWidget {
  final TodoEntity _data;
  final ValueChanged<bool?>? _onChanged;
  final GestureTapCallback _onTapOfEdit;
  final void Function()? _onPress;

  final DismissDirectionCallback? _onDismissed;
  final TodoListItemComponentVariant _variant;

  final ValueKey _uniqueKey;

  const TodoListItemComponent({
    super.key,
    required TodoEntity todoData,
    required void Function(bool?)? onChanged,
    required void Function() onTapOfEdit,
    void Function()? onPress,
    required ValueKey<dynamic> uniqueKey,
    void Function(DismissDirection)? onDismissed,
    TodoListItemComponentVariant variant = TodoListItemComponentVariant.primary,
  })  : _uniqueKey = uniqueKey,
        _variant = variant,
        _onDismissed = onDismissed,
        _onTapOfEdit = onTapOfEdit,
        _onChanged = onChanged,
        _onPress = onPress,
        _data = todoData;

  @override
  Widget build(BuildContext context) {
    final style = useMemoized(() => TodoListItemComponentStyle(variant: _variant), []);

    if (context.read<TodoBloc>().state is NoInternetState) {
      // DISMISSIBLE ONLY IF HAS INTERNET
      return TodoItem(
        onPress: _onPress,
        data: _data,
        onChanged: _onChanged,
        onTapOfEdit: _onTapOfEdit,
        style: style,
      );
    }

    return Dismissible(
      key: _uniqueKey,
      background: const BackgroundComponent(icon: Icons.archive),
      secondaryBackground: const BackgroundComponent(
        variant: BackgroundComponentVariant.delete,
        icon: Icons.delete,
      ),
      onDismissed: _onDismissed,
      child: TodoItem(
        data: _data,
        onChanged: _onChanged,
        onTapOfEdit: _onTapOfEdit,
        style: style,
      ),
    );
  }
}

class TodoItem extends StatelessWidget {
  final TodoEntity _data;
  final ValueChanged<bool?>? _onChanged;
  final VoidCallback? _onPress;
  final GestureTapCallback _onTapOfEdit;
  final TodoListItemComponentStyle _style;

  const TodoItem({
    super.key,
    required TodoEntity data,
    required void Function(bool?)? onChanged,
    required void Function() onTapOfEdit,
    required TodoListItemComponentStyle style,
    void Function()? onPress,
    TodoListItemComponentVariant variant = TodoListItemComponentVariant.primary,
  })  : _style = style,
        _onTapOfEdit = onTapOfEdit,
        _onPress = onPress,
        _onChanged = onChanged,
        _data = data;

  @override
  Widget build(BuildContext context) {
    final priority = priorityList.firstWhere(
      (p) => p.code == _data.priority,
      orElse: () => PriorityModel(title: 'No Priority', code: 'no_priority', color: slateGray),
    );

    return PressableBox(
      style: _style.style(context),
      onPress: _onPress,
      child: Row(
        children: [
          BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              if (state is NoInternetState) return const Offstage();

              return Checkbox(
                value: _data.isCompleted ?? false,
                onChanged: _onChanged,
              );
            },
          ),
          4.width,
          Expanded(
            child: VBox(
              style: _style.columnStyleOfStartMin(context),
              children: [
                StyledText(_data.title ?? '', style: _style.style(context)),
                StyledText(_data.description ?? '', style: _style.style(context, fontWeight: FontWeight.normal)),
                HBox(
                  style: _style.rawStyleOfStartMin(context, sizeBetweenChildren: 2),
                  children: [
                    const Icon(Icons.calendar_month, size: 12, color: greenColor),
                    2.width,
                    StyledText(timeService.convertToTime(_data.startTime ?? DateTime.now()), style: _style.style(context, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
          HBox(
            style: _style.rawStyleOfStartMin(context),
            children: [
              Icon(Icons.flag, size: 22, color: priority.color),
              BlocBuilder<TodoBloc, TodoState>(
                builder: (context, state) {
                  if (state is NoInternetState) return const Offstage();

                  return GestureDetector(
                    onTap: _onTapOfEdit,
                    child: const Icon(Icons.edit, size: 22),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
