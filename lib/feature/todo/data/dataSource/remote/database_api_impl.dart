import 'package:todo_app/core/todo_library.dart';

class TodoEndPoint {
  static const String createTodo = 'api/todo';
  static const String getTodoList = 'api/todo';
  static const String updateTodo = 'api/updateTodo';
  static const String deleteTodo = 'api/todo/deleteTodo';

  TodoEndPoint._();
}

class DataBaseApiImpl implements BaseApi {
  final RestApi restApi;

  const DataBaseApiImpl(this.restApi);

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
  Future<void> deleteTodo(String todoId) async {
    await restApi.request(
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

    todoList.data?.forEach((element) {
      TodoModel _todo = TodoModel(
        todoId: element.id!.toInt(),
        title: element.title,
        description: element.description,
        notes: element.notes,
        date: DateTime.parse(element.date.validate()),
        endTime: DateTime.parse(element.endTime.validate()),
        startTime: DateTime.parse(element.startTime.validate()),
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
