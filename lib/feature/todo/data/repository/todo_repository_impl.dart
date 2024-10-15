import 'package:todo_app/core/app_library.dart';

class TodoRepositoryImpl implements TodoRepository {
  final BaseApi baseApi;

  TodoRepositoryImpl(this.baseApi);

  @override
  Future<List<TodoEntity>> getListOfTodos() async {
    return await baseApi.getListOfTodos();
  }

  @override
  Future<void> updateTodo(Map<String, dynamic> todoData, String todoId) async {
    baseApi.updateTodo(todoId, todoData);
  }

  @override
  Future<void> deleteTodos(String todoId) async {
    await baseApi.deleteTodo(todoId);
  }

  @override
  Future<String> createTodo(Map<String, dynamic> todoData) async {
    return await baseApi.createTodo(todoData);
  }

  @override
  Future<bool> updateTodoId({required String id, required Map<String, String> request}) async {
    return await updateTodo(request, id).then((value) => true).catchError((e) => false);
  }
}
