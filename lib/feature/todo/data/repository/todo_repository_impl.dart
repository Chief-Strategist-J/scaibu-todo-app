import 'package:todo_app/feature/todo/data/dataSource/base_api.dart';
import 'package:todo_app/feature/todo/domain/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final BaseApi baseApi;
  TodoRepositoryImpl(this.baseApi);



  @override
  getListOfTodos() {
    return baseApi.getListOfTodos();
  }

  @override
  void updateTodo(Map<String, dynamic> todoData, String todoId) {
    baseApi.updateTodo(todoId, todoData);
  }

  @override
  void deleteTodos(String todoId) {
    baseApi.deleteTodo(todoId);
  }

  @override
  Future<void> createTodo(Map<String, dynamic> todoData) async {
    baseApi.createTodo(todoData);
  }
}
