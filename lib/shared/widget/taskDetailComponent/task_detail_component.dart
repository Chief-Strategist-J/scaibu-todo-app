import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/shared/widget/taskDetailComponent/component/tag_list_component.dart';

enum ChildClassType {
  createPomodoro,
  createPriority,
  createTags,
  createProject,
}

class TaskDetailComponent extends HookWidget {
  final TaskDetailComponentVariant _variant;
  final ManageTodoPageParam localTodoData;

  const TaskDetailComponent({
    TaskDetailComponentVariant variant = TaskDetailComponentVariant.primary,
    required this.localTodoData,
    super.key,
  }) : _variant = variant;

  List<IconButtonComponentData> _listOfComponent(BuildContext context, TaskDetailComponentVariantStyle style) {
    Future<void> _handleTap(ChildClassType type) async {
      await _onTapIcon(context, style, type: type);
    }

    final int pomodoroCount = context.select(
      (TaskDetailBloc value) {
        final state = value.state;
        return state is TaskDetailDataState ? state.pomodoroCont ?? 0 : 0;
      },
    );

    return [
      IconButtonComponentData(
        text: "Priority",
        icon: Assets.iconIcFlag,
        onTap: () => _handleTap(ChildClassType.createPriority),
      ),
      IconButtonComponentData(
        text: "Pomodoro",
        icon: Assets.iconIcFilledSun,
        prefixText: "$pomodoroCount",
        onTap: () => _handleTap(ChildClassType.createPomodoro),
      ),
      IconButtonComponentData(
        text: "Tags",
        icon: Assets.iconIcTag,
        onTap: () => _handleTap(ChildClassType.createTags),
      ),
      IconButtonComponentData(
        text: "Project",
        icon: Assets.iconIcOfficeBag,
        onTap: () => _handleTap(ChildClassType.createProject),
      ),
    ];
  }

  Future<void> _onTapIcon(
    BuildContext context,
    TaskDetailComponentVariantStyle style, {
    required ChildClassType type,
  }) async {
    final widgetMap = {
      ChildClassType.createPomodoro: CreatePomodoroComponent(style: style, localTodoData: localTodoData),
      ChildClassType.createPriority: CreateTaskPriorityComponent(style: style, localTodoData: localTodoData),
      ChildClassType.createTags: CreateTaskTagsComponent(style: style, localTodoData: localTodoData),
      ChildClassType.createProject: CreateProjectComponent(style: style, localTodoData: localTodoData),
    };

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return BlocProvider.value(
          value: context.read<TaskDetailBloc>(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: widgetMap[type],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final style = useMemoized(() => TaskDetailComponentVariantStyle(variant: _variant), []);

    return BlocProvider(
      create: (BuildContext context) => TaskDetailBloc()..add(InitTaskDetailEvent(todoPageData: localTodoData)),
      child: Builder(
        builder: (context) {
          return VBox(
            style: Style($flex.crossAxisAlignment.start()),
            children: [
              8.height,
              TagListComponent(localTodoData: localTodoData),
              Divider(color: shadowColor, endIndent: 16, indent: 16, thickness: 0.4),
              Center(
                child: Wrap(
                  children: _listOfComponent(context, style).map((data) {
                    return IconButtonComponent(data: data, style: style, localTodoData: localTodoData);
                  }).toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
