import 'package:todo_app/core/app_library.dart';

class TodoListItemComponent extends HookWidget {
  final TodoEntity _data;
  final ValueChanged<bool?>? _onChanged;
  final GestureTapCallback _onTapOfEdit;
  final GestureTapCallback _onTapOfSee;
  final void Function()? _onPress;

  final DismissDirectionCallback? _onDismissed;
  final TodoListItemComponentVariant _variant;

  final ValueKey<int?> _uniqueKey;

  const TodoListItemComponent({
    super.key,
    required final TodoEntity todoData,
    required final void Function(bool?)? onChanged,
    required final void Function() onTapOfEdit,
    required final void Function() onTapOfSee,
    final void Function()? onPress,
    required final ValueKey<dynamic> uniqueKey,
    final void Function(DismissDirection)? onDismissed,
    final TodoListItemComponentVariant variant =
        TodoListItemComponentVariant.primary,
  })  : _uniqueKey = uniqueKey,
        _variant = variant,
        _onDismissed = onDismissed,
        _onTapOfEdit = onTapOfEdit,
        _onTapOfSee = onTapOfSee,
        _onChanged = onChanged,
        _onPress = onPress,
        _data = todoData;

  @override
  Widget build(final BuildContext context) {
    final TodoListItemComponentStyle style = useMemoized(
        () => TodoListItemComponentStyle(variant: _variant), <Object?>[]);

    if (context.read<TodoBloc>().state is NoInternetState) {
      // DISMISSIBLE ONLY IF HAS INTERNET
      return TodoItem(
        onPress: _onPress,
        data: _data,
        onChanged: _onChanged,
        onTapOfEdit: _onTapOfEdit,
        onTapOfSee: _onTapOfSee,
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
        onTapOfSee: _onTapOfSee,
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
  final GestureTapCallback _onTapOfSee;
  final TodoListItemComponentStyle _style;

  const TodoItem({
    required final TodoEntity data,
    required final void Function(bool? onChanged)? onChanged,
    required final void Function() onTapOfEdit,
    required final void Function() onTapOfSee,
    required final TodoListItemComponentStyle style,
    super.key,
    final void Function()? onPress,
  })  : _style = style,
        _onTapOfEdit = onTapOfEdit,
        _onTapOfSee = onTapOfSee,
        _onPress = onPress,
        _onChanged = onChanged,
        _data = data;

  Widget _buildTags(final BuildContext context) {
    if (_data.tagNames.validate().isNotEmpty) {
      return Wrap(
          children: _data.tagNames.validate().map((final String e) {
        if (e.isEmpty) {
          return const Offstage();
        }

        return StyledText('#$e ', style: _style.style(context, fontSize: 10));
      }).toList());
    }
    return const Offstage();
  }

  @override
  Widget build(final BuildContext context) {
    final PriorityModel priority = priorityList.firstWhere(
      (final PriorityModel p) => p.code == _data.priority,
      orElse: () => PriorityModel(
          title: 'No Priority', code: 'no_priority', color: slateGray),
    );

    return PressableBox(
      style: _style.style(context),
      onPress: _onPress,
      child: Row(
        children: <Widget>[
          BlocBuilder<TodoBloc, TodoState>(
            builder: (final BuildContext context, final TodoState state) {
              if (state is NoInternetState) {
                return const Offstage();
              }

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
              children: <Widget>[
                StyledText(_data.title ?? '', style: _style.style(context)),
                _buildTags(context),
                HBox(
                  style: _style.rawStyleOfStartMin(context,
                      sizeBetweenChildren: 2),
                  children: <Widget>[
                    StyledText(
                        timeService
                            .convertToTime(_data.startTime ?? DateTime.now()),
                        style: _style.style(context, fontSize: 10)),
                    const Icon(Icons.calendar_month,
                        size: 12, color: greenColor),
                    2.width,
                    Icon(Icons.flag, size: 12, color: priority.color),
                  ],
                ),
              ],
            ),
          ),
          HBox(
            style: _style.rawStyleOfStartMin(context, sizeBetweenChildren: 1),
            children: <Widget>[
              BlocBuilder<TodoBloc, TodoState>(
                builder: (final BuildContext context, final TodoState state) {
                  if (state is NoInternetState) {
                    return const Offstage();
                  }

                  return GestureDetector(
                    onTap: _onTapOfEdit,
                    child: const Icon(Icons.edit, size: 22),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.remove_red_eye, size: 22),
                onPressed: _onTapOfSee,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
