import 'package:todo_app/feature/todo/domain/entity/todo_entity.dart';

abstract interface class TodoRepository {
  Future<String> createTodo(Map<String, dynamic> todoData);

  Future<void> updateTodo(Map<String, dynamic> todoData, String todoId);

  Future<List<TodoEntity>> getListOfTodos();

  Future<void> deleteTodos(String todoId);

  Future<bool> updateTodoId({required String id, required Map<String, String> request});
}
