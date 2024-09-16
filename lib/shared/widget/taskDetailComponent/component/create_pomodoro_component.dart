import 'package:todo_app/core/app_library.dart';

class CreatePomodoroComponent extends StatelessWidget {
  final TaskDetailComponentVariantStyle _style;
  final ManageTodoPageParam localTodoData;

  const CreatePomodoroComponent({
    required TaskDetailComponentVariantStyle style,
    required this.localTodoData,
    super.key,
  }) : _style = style;

  void _onTapOfPomodoro(BuildContext context) {
    final currState = context.read<TaskDetailBloc>().state;
    if (currState is TaskDetailDataState) {
      localTodoData.pomodorowDuration.value = currState.pomodoroDuration.validate();
      localTodoData.pomodorowCount.value = currState.pomodoroCont.validate();
    }

    finish(context);
  }

  void onTapOfPomodowoDuration(BuildContext context, int index) {
    context.read<TaskDetailBloc>().add(UpdatePomodoroDurationEvent(duration: (index + 1) * 10));
  }

  void onTapOfPomodowoCont(BuildContext context, int index) {
    context.read<TaskDetailBloc>().add(UpdatePomodoroCounterEvent(count: index + 1));
  }

  @override
  Widget build(BuildContext context) {
    final isSelectedPomodoroContIndex = context.select(
      (TaskDetailBloc value) {
        final state = value.state;
        return state is TaskDetailDataState ? state.pomodoroCont ?? 0 : 0;
      },
    );

    final isSelectedPomodoroDurationIndex = context.select(
      (TaskDetailBloc value) {
        final state = value.state;
        return state is TaskDetailDataState ? state.pomodoroDuration ?? 0 : 0;
      },
    );

    return PressableBox(
      style: _style.dialogStyle(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          16.height,
          Expanded(child: Text("Estimated Pomodoros : ", style: boldTextStyle(size: 16))),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 15,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return PomodoroCont(
                  index: index + 1,
                  isSelectedIndex: isSelectedPomodoroContIndex,
                  onTap: () {
                    onTapOfPomodowoCont(context, index);
                  },
                );
              },
            ),
          ),
          32.height,
          Expanded(child: Text("Estimated Pomodoro Time: ", style: boldTextStyle(size: 16))),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 15,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return PomodoroCont(
                  isSelectedIndex: isSelectedPomodoroDurationIndex,
                  index: (index + 1) * 10,
                  onTap: () {
                    onTapOfPomodowoDuration(context, index);
                  },
                );
              },
            ),
          ),
          16.height,
          Expanded(
            child: TagButtonComponent(
              onTapOfCancel: () {
                finish(context);
              },
              onTapOfAdd: () {
                _onTapOfPomodoro(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
