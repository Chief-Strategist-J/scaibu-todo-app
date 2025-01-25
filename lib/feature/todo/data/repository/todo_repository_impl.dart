import 'package:todo_app/core/app_library.dart';

/// Doc Required
class TodoRepositoryImpl implements TodoRepository {
  /// Doc Required
  TodoRepositoryImpl(this.baseApi);

  /// Doc Required
  final BaseApi baseApi;

  @override
  Future<List<TodoEntity>> getListOfTodos() async => baseApi.getListOfTodos();

  @override
  Future<void> updateTodo(
      final Map<String, dynamic> todoData, final String todoId) async {
    await baseApi.updateTodo(todoId, todoData);
  }

  @override
  Future<void> deleteTodos(final String todoId) async {
    await baseApi.deleteTodo(todoId);
  }

  @override
  Future<String> createTodo(final Map<String, dynamic> todoData) async =>
      baseApi.createTodo(todoData);

  @override
  Future<bool> updateTodoId(
          {required final String id,
          required final Map<String, String> request}) async =>
      updateTodo(request, id)
          .then((final void value) => true)
          .catchError((final void e) => false);
}
