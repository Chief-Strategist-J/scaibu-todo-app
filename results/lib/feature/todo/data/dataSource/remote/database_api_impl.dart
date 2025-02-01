import 'package:todo_app/core/app_library.dart';

/// Doc Required
class TodoEndPoint {
  TodoEndPoint._();

  /// Doc Required
  static const String createTodo = 'api/todo/store';

  /// Doc Required
  static const String getTodoList = 'api/todo';

  /// Doc Required
  static const String updateTodo = 'api/todo/updateTodo';

  /// Doc Required
  static const String deleteTodo = 'api/todo/deleteTodo';
}

/// Doc Required
class DataBaseApiImpl implements BaseApi {
  /// Doc Required
  const DataBaseApiImpl(this.restApi);

  /// Doc Required
  final RestApi restApi;

  @override
  Future<String> createTodo(final Map<String, dynamic> todoData) async {
    final CreateTodoResponse createTodoResponse = CreateTodoResponse.fromJson(
      await restApi.request<dynamic>(
        endPoint: TodoEndPoint.createTodo,
        requestBody: todoData,
        type: HttpRequestMethod.post,
      ),
    );

    return createTodoResponse.data!.id.toString();
  }

  @override
  Future<void> deleteTodo(final String todoId) async {
    await restApi.request<dynamic>(
      endPoint: TodoEndPoint.deleteTodo,
      requestBody: <String, dynamic>{'todo_id': todoId},
      type: HttpRequestMethod.post,
    );
  }

  @override
  Future<List<TodoEntity>> getListOfTodos() async {
    if (userCredentials.getUserId == null) {
      return <TodoEntity>[];
    }

    final TodoListResponse todoList = TodoListResponse.fromJson(
      await restApi.request<dynamic>(
        endPoint: TodoEndPoint.getTodoList,
        type: HttpRequestMethod.post,
        requestBody: <String, dynamic>{
          'user_id': userCredentials.getUserId,
        },
      ),
    );
    if (todoList.data == null) {
      return <TodoEntity>[];
    }
    if (todoList.data!.isEmpty) {
      return <TodoEntity>[];
    }

    final List<TodoEntity> todoList0 = <TodoEntity>[];

    todoList.data?.forEach((final Data element) {
      final TodoEntity todo = TodoEntity(
        todoId: element.id!.toInt(),
        title: element.title,
        firebaseTodoId: element.firebaseTodoId as String?,
        description: element.description,
        notes: element.notes,
        date: timeService.parseDateTimeISO8601(element.date.validate()),
        endTime: timeService.parseDateTimeISO8601(element.endTime.validate()),
        startTime:
            timeService.parseDateTimeISO8601(element.startTime.validate()),
        priority: element.priority,
        tagNames: element.tagNames,
      );

      todoList0.add(todo);
    });

    return todoList0;
  }

  @override
  Future<void> updateTodo(
    final String todoId,
    final Map<String, dynamic> updateTodoData,
  ) async {
    await restApi.request<dynamic>(
      endPoint: TodoEndPoint.updateTodo,
      requestBody: updateTodoData,
      type: HttpRequestMethod.post,
    );
  }
}
