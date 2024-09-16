import 'package:todo_app/core/app_library.dart';

class TodoEndPoint {
  static const String createTodo = 'api/todo/store';
  static const String getTodoList = 'api/todo';
  static const String updateTodo = 'api/todo/updateTodo';
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
        type: HttpRequestMethod.post,
      ),
    );

    return createTodoResponse.data!.id.toString();
  }

  @override
  Future<void> deleteTodo(String todoId) async {
    await restApi.request(
      endPoint: TodoEndPoint.deleteTodo,
      requestBody: {'todo_id': todoId},
      type: HttpRequestMethod.post,
    );
  }

  @override
  Future<List<TodoModel>> getListOfTodos() async {
    TodoListResponse todoList = TodoListResponse.fromJson(
      await restApi.request(
        endPoint: TodoEndPoint.getTodoList,
        type: HttpRequestMethod.post,
        requestBody: {
          'user_id': userCredentials.getUserId,
        },
      ),
    );
    if (todoList.data == null) return [];
    if (todoList.data!.isEmpty) return [];

    final todoList0 = <TodoModel>[];

    todoList.data?.forEach((element) {
      TodoModel todo = TodoModel(
        todoId: element.id!.toInt(),
        title: element.title,
        firebaseTodoId: element.firebaseTodoId,
        description: element.description,
        notes: element.notes,
        date: timeService.parseDateTimeISO8601(element.date.validate()),
        endTime: timeService.parseDateTimeISO8601(element.endTime.validate()),
        startTime: timeService.parseDateTimeISO8601(element.startTime.validate()),
        priority: element.priority,
        tagNames: element.tagNames,
      );

      todoList0.add(todo);
    });

    return todoList0;
  }

  @override
  Future<void> updateTodo(String todoId, Map<String, dynamic> updateTodoData) async {
    await restApi.request(
      endPoint: TodoEndPoint.updateTodo,
      requestBody: updateTodoData,
      type: HttpRequestMethod.post,
    );
  }
}
