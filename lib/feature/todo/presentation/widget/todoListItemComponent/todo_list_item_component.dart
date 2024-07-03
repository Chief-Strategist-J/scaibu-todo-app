import 'package:todo_app/core/app_library.dart';

class TodoListItemComponent extends HookWidget {
  final TodoEntity _data;
  final ValueChanged<bool?>? _onChanged;
  final GestureTapCallback _onTapOfEdit;

  final DismissDirectionCallback? _onDismissed;
  final TodoListItemComponentVariant _variant;
  final TodoBloc _todoBloc;

  final ValueKey _uniqueKey;

  const TodoListItemComponent({
    super.key,
    required TodoEntity todoData,
    required void Function(bool?)? onChanged,
    required void Function() onTapOfEdit,
    void Function()? onPress,
    required ValueKey<dynamic> uniqueKey,
    required TodoBloc todoBloc,
    void Function(DismissDirection)? onDismissed,
    TodoListItemComponentVariant variant = TodoListItemComponentVariant.primary,
  })  : _uniqueKey = uniqueKey,
        _todoBloc = todoBloc,
        _variant = variant,
        _onDismissed = onDismissed,
        _onTapOfEdit = onTapOfEdit,
        _onChanged = onChanged,
        _data = todoData;

  @override
  Widget build(BuildContext context) {
    final style = useMemoized(() => TodoListItemComponentStyle(variant: _variant), []);

    if (_todoBloc.state is InitTodoState) {
      // DISMISSIBLE ONLY IF HAS INTERNET
      return Dismissible(
        key: _uniqueKey,
        background: const BackgroundComponent(icon: Icons.archive),
        secondaryBackground: const BackgroundComponent(
          variant: BackgroundComponentVariant.delete,
          icon: Icons.delete,
        ),
        onDismissed: _onDismissed,
        child: TodoItem(
          todoBloc: _todoBloc,
          data: _data,
          onChanged: _onChanged,
          onTapOfEdit: _onTapOfEdit,
          style: style,
        ),
      );
    }

    return TodoItem(
      todoBloc: _todoBloc,
      data: _data,
      onChanged: _onChanged,
      onTapOfEdit: _onTapOfEdit,
      style: style,
    );
  }
}

class TodoItem extends StatelessWidget {
  final TodoBloc _todoBloc;
  final TodoEntity _data;
  final ValueChanged<bool?>? _onChanged;
  final VoidCallback? _onPress;
  final GestureTapCallback _onTapOfEdit;
  final TodoListItemComponentStyle _style;

  const TodoItem({
    super.key,
    required TodoBloc todoBloc,
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
        _data = data,
        _todoBloc = todoBloc;

  @override
  Widget build(BuildContext context) {
    return PressableBox(
      style: _style.style(context),
      onPress: _onPress,
      child: Row(
        children: [
          BlocBuilder<TodoBloc, TodoState>(
            bloc: _todoBloc,
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
                    StyledText('2:00 AM', style: _style.style(context, fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
          HBox(
            style: _style.rawStyleOfStartMin(context),
            children: [
              const Icon(Icons.flag, size: 22),
              BlocBuilder<TodoBloc, TodoState>(
                bloc: _todoBloc,
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
