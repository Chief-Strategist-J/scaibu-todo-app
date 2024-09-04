import 'package:todo_app/core/app_library.dart';
class PomodoroCont extends StatelessWidget {
  final int _index;

  const PomodoroCont({super.key, required int index}) : _index = index;

  void _onTapOfPomodoroCounter(BuildContext context) {
    context.read<TaskDetailBloc>().add(UpdatePomodoroCounterEvent(count: _index));
  }

  @override
  Widget build(BuildContext context) {
    final isSelectedIndex = context.select(
      (TaskDetailBloc value) {
        final state = value.state;
        return state is TaskDetailDataState ? state.pomodoroCont ?? 0 : 0;
      },
    );

    bool _isSelectedCounter = (isSelectedIndex == _index);
    final FontWeight _weight = _isSelectedCounter ? FontWeight.bold : FontWeight.normal;
    final WidgetStateProperty<Color>? _backgroundColor = _isSelectedCounter ? WidgetStateProperty.all<Color>(cardColor) : null;
    final Color? _color = _isSelectedCounter ? white : null;

    return TextButton(
      onPressed: () {
        _onTapOfPomodoroCounter(context);
      },
      style: ButtonStyle(backgroundColor: _backgroundColor),
      child: Text(
        '$_index',
        style: boldTextStyle(
          weight: _weight,
          color: _color,
        ),
      ),
    );
  }
}
