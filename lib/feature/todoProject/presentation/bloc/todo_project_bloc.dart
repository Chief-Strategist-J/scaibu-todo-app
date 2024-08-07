import 'package:bloc/bloc.dart';

import 'todo_project_event.dart';
import 'todo_project_state.dart';

class TodoProjectBloc extends Bloc<TodoProjectEvent, TodoProjectState> {
  TodoProjectBloc() : super(TodoProjectState().init()) {
    on<InitTodoProjectEvent>(_init);
  }

  void _init(InitTodoProjectEvent event, Emitter<TodoProjectState> emit) async {
    emit(state.clone());
  }
}
