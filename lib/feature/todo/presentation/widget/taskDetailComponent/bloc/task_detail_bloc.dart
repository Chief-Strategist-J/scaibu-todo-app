import 'package:bloc/bloc.dart';
import 'task_detail_event.dart';
import 'task_detail_state.dart';

class TaskDetailBloc extends Bloc<TaskDetailEvent, TaskDetailState> {
  TaskDetailBloc() : super(TaskDetailInitState()) {
    on<InitTaskDetailEvent>(_init);
    on<UpdatePomodoroCounterEvent>(_updatePomodoro);
    on<UpdatePriorityEvent>(_updatePriority);
  }

  @override
  Future<void> close() async {
    await super.close();
  }

  void _init(InitTaskDetailEvent event, Emitter<TaskDetailState> emit) async {
    emit(TaskDetailDataState(pomodoroCont: 0));
  }

  void _updatePomodoro(UpdatePomodoroCounterEvent event, Emitter<TaskDetailState> emit) async {
    emit(TaskDetailDataState(pomodoroCont: event.count));
  }

  void _updatePriority(UpdatePriorityEvent event, Emitter<TaskDetailState> emit) async {
    emit(TaskDetailDataState(priority: event.priority));
  }
}
