import 'package:todo_app/feature/todo/domain/entity/todo_entity.dart';

/// Doc Required
abstract interface class TodoRepository {
  /// Doc Required
  Future<String> createTodo(final Map<String, dynamic> todoData);

  /// Doc Required
  Future<void> updateTodo(
    final Map<String, dynamic> todoData,
    final String todoId,
  );

  /// Doc Required
  Future<List<TodoEntity>> getListOfTodos();

  /// Doc Required
  Future<void> deleteTodos(final String todoId);

  /// Doc Required
  Future<bool> updateTodoId({
    required final String id,
    required final Map<String, String> request,
  });
}
