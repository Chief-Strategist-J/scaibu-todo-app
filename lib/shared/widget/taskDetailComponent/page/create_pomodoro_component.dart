import 'package:todo_app/core/app_library.dart';

/// Doc Required
class CreatePomodoroComponent extends StatelessWidget {
  /// Doc Required
  const CreatePomodoroComponent({
    required final TaskDetailComponentVariantStyle style,
    required final ManageTodoPageParam localTodoData,
    super.key,
  })  : _localTodoData = localTodoData,
        _style = style;

  final TaskDetailComponentVariantStyle _style;
  final ManageTodoPageParam _localTodoData;

  void _onTapOfPomodoro(final BuildContext context) {
    final TaskDetailState currState = context.read<TaskDetailBloc>().state;
    if (currState is TaskDetailDataState) {
      _localTodoData.pomodorowDuration.value =
          currState.pomodoroDuration.validate();
      _localTodoData.pomodorowCount.value = currState.pomodoroCont.validate();
    }

    finish(context);
  }

  void _onTapOfPomodowoDuration(final BuildContext context, final int index) {
    context
        .read<TaskDetailBloc>()
        .add(UpdatePomodoroDurationEvent(duration: (index + 1) * 10));
  }

  void _onTapOfPomodowoCont(final BuildContext context, final int index) {
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
            child: Text(
              'Estimated Pomodoros : ',
              style: boldTextStyle(size: 16),
            ),
          ),
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
                  _onTapOfPomodowoCont(context, index);
                },
              ),
            ),
          ),
          32.height,
          Expanded(
            child: Text(
              'Estimated Pomodoro Time: ',
              style: boldTextStyle(size: 16),
            ),
          ),
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
                  _onTapOfPomodowoDuration(context, index);
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
