import 'package:bloc/bloc.dart';
import 'package:todo_app/feature/pomodoro/presentation/bloc/pomodoro_event.dart';
import 'package:todo_app/feature/pomodoro/presentation/bloc/pomodoro_state.dart';

class PomodoroBloc extends Bloc<PomodoroEvent, PomodoroState> {
  PomodoroBloc() : super(PomodoroDataState.init()) {
    on<PomodoroEvent>(_init);
  }

  void _init(
      final PomodoroEvent event, final Emitter<PomodoroState> emit) async {
    emit(state);
  }
}
