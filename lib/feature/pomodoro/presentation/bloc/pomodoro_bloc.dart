import 'package:bloc/bloc.dart';
import 'package:todo_app/feature/pomodoro/presentation/bloc/pomodoro_event.dart';
import 'package:todo_app/feature/pomodoro/presentation/bloc/pomodoro_state.dart';

/// Doc Required
class PomodoroBloc extends Bloc<PomodoroEvent, PomodoroState> {
  /// Doc Required
  PomodoroBloc() : super(PomodoroDataState.init()) {
    on<PomodoroEvent>(_init);
  }

  Future<void> _init(
    final PomodoroEvent event,
    final Emitter<PomodoroState> emit,
  ) async {
    emit(state);
  }
}
