import 'package:todo_app/core/network/network_service.dart';
import 'package:todo_app/feature/todo/data/dataSource/base_api.dart';

class TodoEndPoint {
  static const String createTodo = 'api/todo';
  static const String getTodoList = 'api/todo';
  static const String updateTodo = 'api/updateTodo';
  static const String deleteTodo = 'api/todo/deleteTodo';

  TodoEndPoint._();
}

class LocalApiImpl implements BaseApi {
  final RestApi restApi;

  const LocalApiImpl(this.restApi);

  @override
  void createTodo(Map<String, dynamic> todoData) {
    restApi.request(
      endPoint: TodoEndPoint.createTodo,
      requestBody: todoData,
      requestAPIName: TodoEndPoint.createTodo,
      type: HttpRequestMethod.GET,
    );
  }

  @override
  void deleteTodo(String todoId) {
    restApi.request(
      endPoint: TodoEndPoint.deleteTodo,
      requestBody: {'todo_id': todoId},
      requestAPIName: TodoEndPoint.deleteTodo,
      type: HttpRequestMethod.DELETE,
    );
  }

  @override
  void getListOfTodos() {
    restApi.request(
      endPoint: TodoEndPoint.getTodoList,
      requestBody: {},
      requestAPIName: TodoEndPoint.getTodoList,
      type: HttpRequestMethod.GET,
    );
  }

  @override
  void updateTodo(String todoId, Map<String, dynamic> updateTodoData) {
    restApi.request(
      endPoint: TodoEndPoint.updateTodo,
      requestBody: updateTodoData,
      requestAPIName: TodoEndPoint.updateTodo,
      type: HttpRequestMethod.PUT,
    );
  }
}
