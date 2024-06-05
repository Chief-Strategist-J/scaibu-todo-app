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
    print("InitEvent triggered"); // Debugging line

    List<TodoEntity> combinedList = [];

    if (fireTodo != null) {
      print("Fetching from fireTodo repository"); // Debugging line
      final fireList = await fireTodo!.getListOfTodos();
      combinedList = fireList;
      print("fireTodo list: ${fireList.length} items"); // Debugging line
    } else if (serverTodo != null) {
      print("Fetching from serverTodo repository"); // Debugging line
      final serverList = await serverTodo!.getListOfTodos();
      combinedList = serverList;
      print("serverTodo list: ${serverList.length} items"); // Debugging line
    }


    emit(InitTodoState(todoList: combinedList));
    print("State emitted with ${combinedList.length} items"); // Debugging line
  }
}
