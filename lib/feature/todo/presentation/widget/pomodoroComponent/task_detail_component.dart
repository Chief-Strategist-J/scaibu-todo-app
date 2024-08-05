import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/todo/presentation/widget/icon_button_component.dart';
import 'package:todo_app/feature/todo/presentation/widget/pomodoroComponent/bloc/task_detail_bloc.dart';
import 'package:todo_app/feature/todo/presentation/widget/pomodoroComponent/bloc/task_detail_event.dart';
import 'package:todo_app/feature/todo/presentation/widget/pomodoroComponent/bloc/task_detail_state.dart';


class TaskDetailComponent extends HookWidget {
  final TaskDetailComponentVariant _variant;

  const TaskDetailComponent({
    TaskDetailComponentVariant variant = TaskDetailComponentVariant.primary,
    super.key,
  }) : _variant = variant;

  Future<void> _onTapOfPomodoro(BuildContext context, TaskDetailComponentVariantStyle style) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return BlocProvider.value(
          value: context.read<TaskDetailBloc>(),
          child: CreatePomodoroComponent(style: style),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final style = useMemoized(() => TaskDetailComponentVariantStyle(variant: _variant), []);

    return BlocProvider(
      create: (BuildContext context) => TaskDetailBloc()..add(InitTaskDetailEvent()),
      child: Builder(
        builder: (context) {
          /// Spacial reference
          final int pomodoroCount = context.select(
            (TaskDetailBloc value) {
              final state = value.state;
              return state is TaskDetailDataState ? state.pomodoroCont ?? 0 : 0;
            },
          );

          return VBox(
            children: [
              16.height,
              Center(
                child: Wrap(
                  children: [
                    IconButtonComponentData(
                      text: "Pomodoro",
                      icon: Assets.iconIcFilledSun,
                      prefixText: "$pomodoroCount",
                      onTap: () async {
                        await _onTapOfPomodoro(context, style);
                      },
                    ),
                    IconButtonComponentData(
                      text: "Priority",
                      icon: Assets.iconIcFlag,
                    ),
                    IconButtonComponentData(
                      text: "Tags",
                      icon: Assets.iconIcTag,
                    ),
                    IconButtonComponentData(
                      text: "Project",
                      icon: Assets.iconIcOfficeBag,
                    ),
                  ].map((e) {
                    return IconButtonComponent(data: e, style: style);
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
