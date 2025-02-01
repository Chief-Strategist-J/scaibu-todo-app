import 'package:todo_app/core/app_library.dart';

/// Doc Required
enum ChildClassType {
  /// Doc Required
  createPomodoro,

  /// Doc Required
  createPriority,

  /// Doc Required
  createTags,

  /// Doc Required
  createProject
}

/// Doc Required
class TaskDetailComponent<T> extends HookWidget {
  /// Doc Required
  const TaskDetailComponent({
    required final ManageTodoPageParam localTodoData,
    final TaskDetailComponentVariant variant =
        TaskDetailComponentVariant.primary,
    super.key,
  })  : _localTodoData = localTodoData,
        _variant = variant;

  final TaskDetailComponentVariant _variant;
  final ManageTodoPageParam _localTodoData;

  List<IconButtonComponentData> _listOfComponent(
    final BuildContext context,
    final TaskDetailComponentVariantStyle style,
  ) {
    Future<void> handleTap(final ChildClassType type) async {
      await _onTapIcon(context, style, type: type);
    }

    return IconButtonComponentData.listOfOptions(
      handleTap: handleTap,
      ctx: context,
    );
  }

  Future<void> _onTapIcon(
    final BuildContext context,
    final TaskDetailComponentVariantStyle style, {
    required final ChildClassType type,
  }) async {
    final Map<ChildClassType, Widget> widgetMap = <ChildClassType, Widget>{
      ChildClassType.createPomodoro:
          CreatePomodoroComponent(style: style, localTodoData: _localTodoData),
      ChildClassType.createPriority: CreateTaskPriorityComponent(
        style: style,
        localTodoData: _localTodoData,
      ),
      ChildClassType.createTags:
          EmptyEntityModel.getTagComponent(style, context, _localTodoData),
      ChildClassType.createProject:
          EmptyEntityModel.getProjectComponent(style, context, _localTodoData),
    };

    await showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      builder: (final _) => BlocProvider<TaskDetailBloc>.value(
        value: context.read<TaskDetailBloc>(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: widgetMap[type],
        ),
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    final TaskDetailComponentVariantStyle style = useMemoized(
      () => TaskDetailComponentVariantStyle(variant: _variant),
      <Object?>[],
    );

    return BlocProvider<TaskDetailBloc>(
      create: (final BuildContext context) => TaskDetailBloc()
        ..add(InitTaskDetailEvent(todoPageData: _localTodoData)),
      child: Builder(
        builder: (final BuildContext context) => VBox(
          style: Style($flex.crossAxisAlignment.start()),
          children: <Widget>[
            8.height,
            TagListComponent(localTodoData: _localTodoData),
            Divider(
              color: shadowColor,
              endIndent: 16,
              indent: 16,
              thickness: 0.4,
            ),
            Center(
              child: Wrap(
                children: _listOfComponent(context, style)
                    .map(
                      (final IconButtonComponentData data) =>
                          IconButtonComponent(
                        data: data,
                        style: style,
                        localTodoData: _localTodoData,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
