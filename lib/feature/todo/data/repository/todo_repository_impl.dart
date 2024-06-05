import 'package:todo_app/feature/todo/data/dataSource/base_api.dart';
import 'package:todo_app/feature/todo/data/model/todo_model.dart';
import 'package:todo_app/feature/todo/domain/entity/todo_entity.dart';
import 'package:todo_app/feature/todo/domain/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final BaseApi baseApi;
  TodoRepositoryImpl(this.baseApi);

  @override
  Future<List<TodoModel>> getListOfTodos() async {
    return await baseApi.getListOfTodos();
    ;
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
}
