import 'package:todo_app/core/todo_library.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository? firebaseRepo;
  final TodoRepository? serverRepo;

  TodoBloc({required this.serverRepo, required this.firebaseRepo}) : super(InitTodoState.init()) {
    on<InitEvent>(_init);
    on<LoadingEvent>(_onLoadingEvent);
  }

  Future<void> _onLoadingEvent(LoadingEvent event, Emitter<TodoState> emit) async {
    emit(LoadingState());
  }

  void _init(InitEvent event, Emitter<TodoState> emit) async {
    final getTodoListUseCase = GetIt.instance<GetTodoListUseCase>();
    final res = await getTodoListUseCase(event.isListUpdated);

    res.fold((failure) {
      logService.crashLog(errorMessage: 'Failed to fetch todo list', e: Object());
    }, (todoList) {
      emit(InitTodoState(todoList: todoList));
    });
  }

  Future<void> updateCheckBoxValue({bool checked = false, required TodoEntity todoItem}) async {
    try {
      if (!isInternetConnected) return;

      final updateTodoUseCase = GetIt.instance<UpdateTodoUseCase>();

      final Map<String, dynamic> todoData = {
        'todo_id': todoItem.todoId.toString(),
        'is_completed': checked.validate(),
      };

      final updateTodo = UpdateTodoParam(
        firebaseID: todoItem.firebaseTodoId.validate(),
        localID: todoItem.todoId.toString(),
        todoData: todoData,
      );


      await updateTodoUseCase(updateTodo);
      add(InitEvent([], isListUpdated: true));
    } catch (e, s) {
      logService.crashLog(errorMessage: 'Error while updating todo', e: e, stack: s);
    }
  }

  Future<void> archiveTodo({required TodoEntity todoItem}) async {
    if (!isInternetConnected) return;

    try {
      final updateTodoUseCase = GetIt.instance<UpdateTodoUseCase>();

      final Map<String, dynamic> todoData = {
        'todo_id': todoItem.todoId.toString(),
        'is_archived': true,
      };

      final updateTodo = UpdateTodoParam(
        firebaseID: todoItem.firebaseTodoId.validate(),
        localID: todoItem.todoId.toString(),
        todoData: todoData,
      );

      await updateTodoUseCase(updateTodo);
      add(InitEvent([], isListUpdated: true));
    } catch (e, s) {
      logService.crashLog(errorMessage: 'Error while updating todo', e: e, stack: s);
    }
  }

  Future<void> createTodo({required ManageTodoPageParam todoDetail}) async {
    final createTodoUseCase = GetIt.instance<CreateTodoUseCase>();

    final Map<String, dynamic> todo = {
      "title": todoDetail.titleController.text,
      "description": todoDetail.descriptionController.text,
      "is_archived": false,
      "is_completed": false,
    };

    try {
      await createTodoUseCase(todo);
      add(InitEvent([], isListUpdated: true));
    } catch (e, s) {
      logService.crashLog(errorMessage: 'An error occurred: $e', e: e, stack: s);
    }
  }

  Future<void> deleteTodo({required TodoEntity todoData}) async {
    final deleteTodoUseCase = GetIt.instance<DeleteTodoUseCase>();

    DeleteTodoParam deleteParam = DeleteTodoParam(
      firebaseId: todoData.firebaseTodoId.validate(),
      localId: todoData.todoId.validate().toString(),
    );

    try {
      await deleteTodoUseCase(deleteParam);
      add(InitEvent([], isListUpdated: true));
    } catch (e, s) {
      logService.crashLog(errorMessage: 'Error while deleting todo', e: e, stack: s);
    }
  }

  Future<void> onEditPageUpdateTodo(ManageTodoPageParam todoPage) async {
    if (todoPage.firebaseTodoId.validate().isEmpty || todoPage.todoId.validate().isEmpty) {
      return;
    }

    final updateTodoUseCase = GetIt.instance<UpdateTodoUseCase>();

    final Map<String, dynamic> todoData = {
      'todo_id': todoPage.todoId,
      'title': todoPage.titleController.text,
      'description': todoPage.descriptionController.text,
    };

    final updateTodo = UpdateTodoParam(
      firebaseID: todoPage.firebaseTodoId.validate(),
      localID: todoPage.todoId.validate(),
      todoData: todoData,
    );

    await updateTodoUseCase(updateTodo);
    add(InitEvent([], isListUpdated: true));
  }
}
