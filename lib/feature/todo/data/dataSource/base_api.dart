import 'package:todo_app/core/app_library.dart';

/// Doc Required
abstract interface class BaseApi {
  /// Doc Required
  Future<String> createTodo(final Map<String, dynamic> todoData);

  /// Doc Required
  Future<void> deleteTodo(final String todoId);

  /// Doc Required
  Future<void> updateTodo(
    final String todoId,
    final Map<String, dynamic> updateTodoData,
  );

  /// Doc Required
  Future<List<TodoEntity>> getListOfTodos();
}
