import 'package:todo_app/core/network/network_service.dart';
import 'package:todo_app/feature/todo/data/dataSource/base_api.dart';
import 'package:todo_app/feature/todo/data/model/response/create_todo_response.dart';
import 'package:todo_app/feature/todo/data/model/response/todo_list_response.dart';
import 'package:todo_app/feature/todo/data/model/todo_model.dart';

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
  Future<String> createTodo(Map<String, dynamic> todoData) async {
    CreateTodoResponse createTodoResponse = CreateTodoResponse.fromJson(
      await restApi.request(
        endPoint: TodoEndPoint.createTodo,
        requestBody: todoData,
        requestAPIName: TodoEndPoint.createTodo,
        type: HttpRequestMethod.POST,
      ),
    );
    return createTodoResponse.data!.id.toString();
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
  Future<List<TodoModel>> getListOfTodos() async {
    TodoListResponse todoList = TodoListResponse.fromJson(
      await restApi.request(
        endPoint: TodoEndPoint.getTodoList,
        requestBody: {},
        requestAPIName: TodoEndPoint.getTodoList,
        type: HttpRequestMethod.GET,
      ),
    );
    if (todoList.data == null) return [];
    if (todoList.data!.isEmpty) return [];

    final _todoList = <TodoModel>[];

    todoList.data!.forEach((element) {
      TodoModel _todo = TodoModel(
        todoId: element.id!.toInt(),
        title: element.title,
        description: element.description,
        notes: element.notes,
      );

      _todoList.add(_todo);
    });

    return _todoList;
  }

  @override
  Future<void> updateTodo(String todoId, Map<String, dynamic> updateTodoData) async {
    await restApi.request(
      endPoint: TodoEndPoint.updateTodo,
      requestBody: updateTodoData,
      requestAPIName: TodoEndPoint.updateTodo,
      type: HttpRequestMethod.POST,
    );
  }
}
