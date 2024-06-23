import 'package:todo_app/core/app_library.dart';

abstract interface class BaseApi {
  Future<String> createTodo(Map<String, dynamic> todoData);
  Future<void> deleteTodo(String todoId);
  Future<void> updateTodo(String todoId, Map<String, dynamic> updateTodoData);
  Future<List<TodoModel>> getListOfTodos();
}
