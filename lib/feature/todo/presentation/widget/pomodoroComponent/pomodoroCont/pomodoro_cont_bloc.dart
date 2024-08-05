import 'package:bloc/bloc.dart';

import 'pomodoro_cont_event.dart';
import 'pomodoro_cont_state.dart';

class PomodoroContBloc extends Bloc<PomodoroContEvent, PomodoroContState> {
  PomodoroContBloc() : super(PomodoroInitState()) {
    on<InitPomodoroEvent>(_init);
    on<UpdatePomodoroEvent>(_updatePomodoro);
  }

  @override
  Future<void> close() async {
    await super.close();
  }

  void _init(InitPomodoroEvent event, Emitter<PomodoroContState> emit) async {
    emit(PomodoroDataState(pomodoroCont: 0));
  }

  void _updatePomodoro(UpdatePomodoroEvent event, Emitter<PomodoroContState> emit) async {
    emit(PomodoroDataState(pomodoroCont: event.count));
  }
}
