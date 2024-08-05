import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/todo/presentation/widget/pomodoroComponent/pomodoroCont/pomodoro_cont_bloc.dart';
import 'package:todo_app/feature/todo/presentation/widget/pomodoroComponent/pomodoroCont/pomodoro_cont_event.dart';
import 'package:todo_app/feature/todo/presentation/widget/pomodoroComponent/pomodoroCont/pomodoro_cont_state.dart';

class PomodoroCont extends StatelessWidget {
  final int _index;

  const PomodoroCont({super.key, required int index}) : _index = index;

  void _onTapOfPomodoroCounter(BuildContext context) {
    context.read<PomodoroContBloc>().add(UpdatePomodoroEvent(count: _index));
    GoRouter.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final isSelectedIndex = context.select(
      (PomodoroContBloc value) {
        final state = value.state;
        return state is PomodoroDataState ? state.pomodoroCont ?? 0 : 0;
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
