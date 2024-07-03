import 'package:todo_app/core/app_library.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository? firebaseRepo;
  final TodoRepository? serverRepo;

  StreamSubscription<InternetStatus>? _internetStatusSubscription;
  List<TodoEntity>? _tempTodoList = [];

  TodoBloc({required this.serverRepo, required this.firebaseRepo}) : super(InitTodoState.init()) {
    on<InitEvent>(_init);
    on<LoadingEvent>(_onLoadingEvent);
    on<NoInternetConnectionEvent>(_onNoInternetConnectionUpdate);
  }

  void getInternetConnectionStatus() {
    _internetStatusSubscription = InternetConnection().onStatusChange.listen(_handleInternetStatusChange);
  }

  @override
  Future<void> close() {
    _internetStatusSubscription?.cancel();
    return super.close();
  }

  Future<void> _onNoInternetConnectionUpdate(NoInternetConnectionEvent event, emit) async {
    emit(NoInternetState(todoList: _tempTodoList));
  }

  Future<void> _onLoadingEvent(LoadingEvent event, Emitter<TodoState> emit) async {
    emit(LoadingState());
  }

  void _handleInternetStatusChange(InternetStatus status) {
    (status == InternetStatus.connected) ? add(InitEvent(const [], isListUpdated: false)) : add(NoInternetConnectionEvent());
  }

  Future<void> _init(InitEvent event, Emitter<TodoState> emit) async {
    getInternetConnectionStatus();

    final getTodoListUseCase = GetIt.instance<GetTodoListUseCase>();
    final res = await getTodoListUseCase(event.isListUpdated);

    res.fold((failure) {
      logService.crashLog(errorMessage: 'Failed to fetch todo list', e: Object());
    }, (todoList) {
      _tempTodoList = todoList;
      emit(InitTodoState(todoList: todoList));
    });
  }

  Future<void> updateCheckBoxValue({bool checked = false, required TodoEntity todoItem}) async {
    try {
      if (!isInternetConnected) {
        add(NoInternetConnectionEvent());
        return;
      }

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
      add(InitEvent(const [], isListUpdated: true));
    } catch (e, s) {
      logService.crashLog(errorMessage: 'Error while updating todo', e: e, stack: s);
    }
  }

  Future<void> archiveTodo({required TodoEntity todoItem}) async {
    if (!isInternetConnected) {
      add(NoInternetConnectionEvent());
      return;
    }

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
      add(InitEvent(const [], isListUpdated: true));
    } catch (e, s) {
      logService.crashLog(errorMessage: 'Error while updating todo', e: e, stack: s);
    }
  }

  Future<void> createTodo({required ManageTodoPageParam todoDetail}) async {
    add(LoadingEvent());

    final createTodoUseCase = GetIt.instance<CreateTodoUseCase>();

    final Map<String, dynamic> todo = {
      "title": todoDetail.title.text,
      "description": todoDetail.description.text,
      "is_archived": false,
      "is_completed": false,
      'notes':todoDetail.note.text,
    };
    if (todoDetail.startTime != null) {
      todo.putIfAbsent('start_time', () => todoDetail.startTime?.dateTime.toString());
    }
    if (todoDetail.endTime != null) {
      todo.putIfAbsent('end_time', () => todoDetail.endTime?.dateTime.toString());
    }
    if (todoDetail.date != null) {
      todo.putIfAbsent('date', () => todoDetail.date?.dateTime.toString());
    }

    try {
      await createTodoUseCase(todo);
      add(InitEvent(const [], isListUpdated: true));
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
      add(InitEvent(const [], isListUpdated: true));
    } catch (e, s) {
      logService.crashLog(errorMessage: 'Error while deleting todo', e: e, stack: s);
    }
  }

  Future<void> onEditPageUpdateTodo(ManageTodoPageParam todoPage) async {
    if (todoPage.firebaseTodoId.validate().isEmpty || todoPage.todoId.validate().isEmpty) {
      return;
    }
    add(LoadingEvent());

    final updateTodoUseCase = GetIt.instance<UpdateTodoUseCase>();

    final Map<String, dynamic> todoData = {
      'todo_id': todoPage.todoId,
      'title': todoPage.title.text,
      'description': todoPage.description.text,
      'notes':todoPage.note.text,
    };

    if (todoPage.startTime != null) {
      todoData.putIfAbsent('start_time', () => todoPage.startTime?.dateTime.toString());
    }
    if (todoPage.endTime != null) {
      todoData.putIfAbsent('end_time', () => todoPage.endTime?.dateTime.toString());
    }
    if (todoPage.date != null) {
      todoData.putIfAbsent('date', () => todoPage.date?.dateTime.toString());
    }

    final updateTodo = UpdateTodoParam(
      firebaseID: todoPage.firebaseTodoId.validate(),
      localID: todoPage.todoId.validate(),
      todoData: todoData,
    );

    await updateTodoUseCase(updateTodo);
    add(InitEvent(const [], isListUpdated: true));
  }
}
