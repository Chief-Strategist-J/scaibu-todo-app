import 'package:bloc/bloc.dart';
import 'package:todo_app/feature/todo/domain/entity/todo_entity.dart';
import 'package:todo_app/feature/todo/domain/repository/todo_repository.dart';
import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository? fireTodo;
  final TodoRepository? serverTodo;

  TodoBloc({required this.serverTodo, required this.fireTodo}) : super(InitTodoState.init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<TodoState> emit) async {
    List<TodoEntity> combinedList = event.todoList ?? [];

    if (combinedList.isNotEmpty) {
      emit(InitTodoState(todoList: combinedList));
      return;
    } else if (fireTodo != null) {
      combinedList = await fireTodo?.getListOfTodos() ?? [];
      return;

    } else if (serverTodo != null) {
      combinedList = await serverTodo?.getListOfTodos() ?? [];
      return;

    }

    emit(InitTodoState(todoList: combinedList));
  }
}
