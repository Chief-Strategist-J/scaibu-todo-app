import 'package:todo_app/core/todo_library.dart';

class TodoRepositoryImpl implements TodoRepository {
  final BaseApi baseApi;

  TodoRepositoryImpl(this.baseApi);

  @override
  Future<List<TodoModel>> getListOfTodos() async {
    return await baseApi.getListOfTodos();
  }

  @override
  Future<void> updateTodo(Map<String, dynamic> todoData, String todoId) async {
    baseApi.updateTodo(todoId, todoData);
  }

  @override
  void deleteTodos(String todoId) {
    baseApi.deleteTodo(todoId);
  }

  @override
  Future<String> createTodo(Map<String, dynamic> todoData) async {
    return await baseApi.createTodo(todoData);
  }

  @override
  Future<bool> updateTodoId({required String Id, required Map<String, String> request}) async {
    return await updateTodo(request, Id).then((value) => true).catchError((e) => false);
  }
}
