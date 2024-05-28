import 'package:bloc/bloc.dart';

import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<TodoState> emit) async {
    emit(state.clone());
  }
}
