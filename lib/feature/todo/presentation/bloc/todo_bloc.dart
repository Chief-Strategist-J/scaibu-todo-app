import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/core/utils/schedule_service.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository? firebaseRepo;
  final TodoRepository? serverRepo;

  StreamSubscription<InternetStatus>? _internetStatusSubscription;
  List<TodoEntity>? _tempTodoList = [];
  bool _internetConnectionStreamInit = true;

  TodoBloc({required this.serverRepo, required this.firebaseRepo}) : super(InitTodoState.init()) {
    on<InitEvent>(_init);
    on<LoadingEvent>(_onLoadingEvent);
    on<NoInternetConnectionEvent>(_onNoInternetConnectionUpdate);
  }

  void _getInternetConnectionStatus() {
    if (_internetConnectionStreamInit) {
      _internetConnectionStreamInit = false;
      log('INTERNET CONNECTION STREAM IN INITIALIZE');
      _internetStatusSubscription = InternetConnection().onStatusChange.listen((status) {
        if (status == InternetStatus.connected) {
          add(InitEvent(const [], isListUpdated: false));
        } else {
          add(NoInternetConnectionEvent());
        }
      });
    }
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

  Future<void> _init(InitEvent event, Emitter<TodoState> emit) async {
    try {
      _getInternetConnectionStatus();

      log('GETTING THE TODO-LIST');
      await GetIt.instance<GetTodoListUseCase>()(event.isListUpdated).then((res) {
        res.fold((failure) {
          logService.crashLog(errorMessage: 'Failed to fetch todo list', e: Object());
        }, (todoList) {
          _tempTodoList = todoList;
          emit(InitTodoState(todoList: todoList));
        });
      });
    } catch (e, s) {
      logService.crashLog(errorMessage: 'Error initializing bloc', e: e, stack: s);
    }
  }

  Future<void> updateCheckBoxValue({bool checked = false, required TodoEntity todoItem}) async {
    try {
      final Map<String, dynamic> todoData = {
        'todo_id': todoItem.todoId.toString(),
        'is_completed': checked.validate(),
      };

      final updateTodo = UpdateTodoParam(
        firebaseID: todoItem.firebaseTodoId.validate(),
        localID: todoItem.todoId.toString(),
        todoData: todoData,
      );

      add(LoadingEvent());
      await GetIt.instance<UpdateTodoUseCase>()(updateTodo).then((value) {
        add(InitEvent(const [], isListUpdated: true));
      });
    } catch (e, s) {
      add(InitEvent(const [], isListUpdated: false));
      logService.crashLog(errorMessage: 'Error while updating todo', e: e, stack: s);
    }
  }

  Future<void> archiveTodo({required TodoEntity todoItem}) async {
    try {
      final Map<String, dynamic> todoData = {
        'todo_id': todoItem.todoId.toString(),
        'is_archived': true,
      };

      final updateTodo = UpdateTodoParam(
        firebaseID: todoItem.firebaseTodoId.validate(),
        localID: todoItem.todoId.toString(),
        todoData: todoData,
      );

      add(LoadingEvent());
      await GetIt.instance<UpdateTodoUseCase>()(updateTodo).then((value) {
        add(InitEvent(const [], isListUpdated: true));
      });
    } catch (e, s) {
      add(InitEvent(const [], isListUpdated: false));
      logService.crashLog(errorMessage: 'Error while updating todo', e: e, stack: s);
    }
  }

  Future<void> createTodo({required ManageTodoPageParam todoDetail}) async {
    final Map<String, dynamic> todo = {
      "title": todoDetail.title.text,
      "description": todoDetail.description.text,
      "is_archived": false,
      "is_completed": false,
      "notes": todoDetail.note.text,
    };

    if (todoDetail.startTime != null) {
      todo.putIfAbsent("start_time", () => todoDetail.startTime?.dateTime.toString());
    }
    if (todoDetail.endTime != null) {
      todo.putIfAbsent("end_time", () => todoDetail.endTime?.dateTime.toString());

      if (todoDetail.isWantToDeleteTodoAtEndTime) {
        todo.putIfAbsent("is_want_to_delete_todo_at_end_time", () => todoDetail.isWantToDeleteTodoAtEndTime);

        scheduleService.performActionAfterTime(
          dateTime: todoDetail.endTime!.dateTime,
          action: () {
            add(InitEvent(const [], isListUpdated: true));
          },
        );
      }
    }
    if (todoDetail.date != null) {
      todo.putIfAbsent("date", () => todoDetail.date?.dateTime.toString());
    }

    if (userCredentials.getIsLogin.validate()) {
      todo.putIfAbsent("created_by", () => userCredentials.getUserId);
    }

    try {
      add(LoadingEvent());
      await GetIt.instance<CreateTodoUseCase>()(todo).then((value) async {
        add(InitEvent(const [], isListUpdated: true));
      });
    } catch (e, s) {
      add(InitEvent(const [], isListUpdated: false));
      logService.crashLog(errorMessage: 'An error occurred: $e', e: e, stack: s);
    }
  }

  Future<void> deleteTodo({required TodoEntity todoData}) async {
    DeleteTodoParam deleteParam = DeleteTodoParam(
      firebaseId: todoData.firebaseTodoId.validate(),
      localId: todoData.todoId.validate().toString(),
    );

    try {
      add(LoadingEvent());
      await GetIt.instance<DeleteTodoUseCase>()(deleteParam).then((value) {
        add(InitEvent(const [], isListUpdated: true));
      });
    } catch (e, s) {
      add(InitEvent(const [], isListUpdated: false));
      logService.crashLog(errorMessage: 'Error while deleting todo', e: e, stack: s);
    }
  }

  Future<void> onEditPageUpdateTodo(ManageTodoPageParam todoPage) async {
    if (todoPage.firebaseTodoId.validate().isEmpty || todoPage.todoId.validate().isEmpty) return;

    final Map<String, dynamic> todoData = {
      'todo_id': todoPage.todoId,
      'title': todoPage.title.text,
      'description': todoPage.description.text,
      'notes': todoPage.note.text,
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

    add(LoadingEvent());
    await GetIt.instance<UpdateTodoUseCase>()(updateTodo).then((value) {
      add(InitEvent(const [], isListUpdated: true));
    });
  }
}
