import 'package:todo_app/feature/todo/data/model/todo_model.dart';

abstract interface class BaseApi{
  Future<String> createTodo(Map<String,dynamic> todoData);
  void deleteTodo(String todoId);
  Future<void> updateTodo(String todoId,Map<String,dynamic> updateTodoData);
  Future<List<TodoModel>> getListOfTodos();
}