import 'package:todo_app/core/app_library.dart';

class CreatePomodoroComponent extends StatelessWidget {
  final TaskDetailComponentVariantStyle _style;
  final ManageTodoPageParam localTodoData;

  const CreatePomodoroComponent({
    required final TaskDetailComponentVariantStyle style,
    required this.localTodoData,
    super.key,
  }) : _style = style;

  void _onTapOfPomodoro(final BuildContext context) {
    final TaskDetailState currState = context.read<TaskDetailBloc>().state;
    if (currState is TaskDetailDataState) {
      localTodoData.pomodorowDuration.value =
          currState.pomodoroDuration.validate();
      localTodoData.pomodorowCount.value = currState.pomodoroCont.validate();
    }

    finish(context);
  }

  void onTapOfPomodowoDuration(final BuildContext context, final int index) {
    context
        .read<TaskDetailBloc>()
        .add(UpdatePomodoroDurationEvent(duration: (index + 1) * 10));
  }

  void onTapOfPomodowoCont(final BuildContext context, final int index) {
    context
        .read<TaskDetailBloc>()
        .add(UpdatePomodoroCounterEvent(count: index + 1));
  }

  @override
  Widget build(final BuildContext context) {
    final int isSelectedPomodoroContIndex = context.select(
      (final TaskDetailBloc value) {
        final TaskDetailState state = value.state;
        return state is TaskDetailDataState ? state.pomodoroCont ?? 0 : 0;
      },
    );

    final int isSelectedPomodoroDurationIndex = context.select(
      (final TaskDetailBloc value) {
        final TaskDetailState state = value.state;
        return state is TaskDetailDataState ? state.pomodoroDuration ?? 0 : 0;
      },
    );

    return PressableBox(
      style: _style.dialogStyle(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          16.height,
          Expanded(
              child: Text('Estimated Pomodoros : ',
                  style: boldTextStyle(size: 16))),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 15,
              shrinkWrap: true,
              itemBuilder: (final BuildContext context, final int index) =>
                  PomodoroCont(
                index: index + 1,
                isSelectedIndex: isSelectedPomodoroContIndex,
                onTap: () {
                  onTapOfPomodowoCont(context, index);
                },
              ),
            ),
          ),
          32.height,
          Expanded(
              child: Text('Estimated Pomodoro Time: ',
                  style: boldTextStyle(size: 16))),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 15,
              shrinkWrap: true,
              itemBuilder: (final BuildContext context, final int index) =>
                  PomodoroCont(
                isSelectedIndex: isSelectedPomodoroDurationIndex,
                index: (index + 1) * 10,
                onTap: () {
                  onTapOfPomodowoDuration(context, index);
                },
              ),
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
