import 'dart:ui';

import 'package:bloc/bloc.dart';

import 'task_detail_event.dart';
import 'task_detail_state.dart';



class TaskDetailBloc extends Bloc<TaskDetailEvent, TaskDetailState> {


  TaskDetailBloc() : super(TaskDetailInitState()) {
    on<InitTaskDetailEvent>(_init);
    on<UpdateTaskDetailEvent>(_updatePomodoro);
  }

  @override
  Future<void> close() async {
    await super.close();
  }

  void _init(InitTaskDetailEvent event, Emitter<TaskDetailState> emit) async {
    emit(TaskDetailDataState(pomodoroCont: 0));
  }

  void _updatePomodoro(UpdateTaskDetailEvent event, Emitter<TaskDetailState> emit) async {
    emit(TaskDetailDataState(pomodoroCont: event.count));
  }
}
