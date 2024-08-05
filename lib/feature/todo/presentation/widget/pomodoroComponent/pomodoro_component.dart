import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/todo/presentation/widget/icon_button_component.dart';
import 'package:todo_app/feature/todo/presentation/widget/pomodoroComponent/pomodoroCont/pomodoro_cont_bloc.dart';
import 'package:todo_app/feature/todo/presentation/widget/pomodoroComponent/pomodoroCont/pomodoro_cont_event.dart';
import 'package:todo_app/feature/todo/presentation/widget/pomodoroComponent/pomodoroCont/pomodoro_cont_state.dart';

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
          value: context.read<PomodoroContBloc>(),
          child: CreatePomodoroComponent(style: style),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final style = useMemoized(() => TaskDetailComponentVariantStyle(variant: _variant), []);

    return BlocProvider(
      create: (BuildContext context) => PomodoroContBloc()..add(InitPomodoroEvent()),
      child: Builder(
        builder: (context) {
          /// Spacial reference
          final int pomodoroCount = context.select(
            (PomodoroContBloc value) {
              final state = value.state;
              return state is PomodoroDataState ? state.pomodoroCont ?? 0 : 0;
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
