
import 'package:todo_app/core/todo_library.dart';

abstract interface class BaseApi{
  Future<String> createTodo(Map<String,dynamic> todoData);
  void deleteTodo(String todoId);
  Future<void> updateTodo(String todoId,Map<String,dynamic> updateTodoData);
  Future<List<TodoModel>> getListOfTodos();
}