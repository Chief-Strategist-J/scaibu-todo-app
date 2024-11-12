import 'package:todo_app/core/app_library.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository? firebaseRepo;
  final TodoRepository? serverRepo;
  List<TodoEntity> tempTodoList = [];

  TodoBloc({required this.serverRepo, required this.firebaseRepo}) : super(InitTodoState.init()) {
    on<InitTodoEvent>(_init);
    on<LoadingEvent>(_onLoadingEvent);
    on<NoInternetConnectionEvent>(_onNoInternetConnectionUpdate);
  }


  Future<void> _onNoInternetConnectionUpdate(NoInternetConnectionEvent event, emit) async {
    emit(NoInternetState(todoList: tempTodoList));
  }

  Future<void> _onLoadingEvent(LoadingEvent event, Emitter<TodoState> emit) async {
    emit(LoadingState());
  }

  Future<void> _init(InitTodoEvent event, Emitter<TodoState> emit) async {
    try {
      log('GETTING THE TODO-LIST');
      await GetIt.instance<GetTodoListUseCase>()(event.isListUpdated).then((res) {
        res.fold((failure) {
          logService.crashLog(errorMessage: 'Failed to fetch todo list', e: Object());
        }, (todoList) {
          tempTodoList = todoList;
          emit(InitTodoState(todoList: tempTodoList));
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
        add(InitTodoEvent(isListUpdated: true));
      });
    } catch (e, s) {
      add(InitTodoEvent(isListUpdated: false));
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
        add(InitTodoEvent(isListUpdated: true));
      });
    } catch (e, s) {
      add(InitTodoEvent(isListUpdated: false));
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
      "priority": todoDetail.priority,
    };

    if (todoDetail.startTime != null) {
      todo.putIfAbsent("start_time", () => todoDetail.startTime?.dateTime.toString());
    }
    if (todoDetail.endTime != null) {
      todo.putIfAbsent("end_time", () => todoDetail.endTime?.dateTime.toString());

      if (todoDetail.isWantToDeleteTodoAtEndTime) {
        todo.putIfAbsent("is_want_to_delete_todo_at_end_time", () => todoDetail.isWantToDeleteTodoAtEndTime);
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
        value.fold((failure) {
          //
        }, (map) async {
          // TODO : currently we are making request in part but in future we are going to merge
          // TODO : all request and making only one request combine todo creating request
          // TODO : combineTodoCreation = createTodo + createAndUpdateTags + createPomodoros
          await _createAndUpdateTags(map, todoDetail);
          await _createPomodoros(todoDetail, map);
        });

        add(InitTodoEvent(isListUpdated: true));
      });
    } catch (e, s) {
      add(InitTodoEvent(isListUpdated: false));
      logService.crashLog(errorMessage: 'An error occurred: $e', e: e, stack: s);
    }
  }

  Future<void> _createPomodoros(ManageTodoPageParam todoDetail, Map<String, dynamic> map) async {
    final todoId = map['todo_id'];

    if (todoDetail.pomodorowDuration.value == 0 || todoDetail.pomodorowCount.value == 0) return;

    final Map<String, dynamic> request = {
      "todo_id": todoId,
      "title": todoDetail.title.text,
      "user_id": userCredentials.getUserId,
      "duration": todoDetail.pomodorowDuration.value,
      "number_of_pomodoros": todoDetail.pomodorowCount.value,
      "status": "pending",
    };
    try {
      final createPomodoro = getIt<CreatePomodoroUseCase>(instanceName: PomodoroDependencyInjection.createPomodoroUseCase);
      await createPomodoro(request);
      toast("added");
    } catch (e) {
      logService.crashLog(errorMessage: 'An error occurred: $e', e: e);
    }
  }

  Future<void> _createAndUpdateTags(Map<String, dynamic> map, ManageTodoPageParam todoDetail) async {
    final todoId = map['todo_id'];

    final deleteTagsByTodoId = getIt<BulkDeleteTagsByTodoIdUseCase>(instanceName: TagsDependencyInjection.bulkDeleteTagsByTodoIdUseCase);
    final bulkCreateTags = getIt<BulkCreateTagsUseCase>(instanceName: TagsDependencyInjection.bulkCreateTagsUseCase);

    final userId = userCredentials.getUserId;

    try {
      if (todoDetail.tags.isEmpty) {
        await deleteTagsByTodoId(todoId);
      } else {
        final tagsCreationReq = todoDetail.tags.map((tag) {
          return {
            'todo_id': todoId,
            'created_by': userId,
            'name': tag.name,
            'color': tag.color,
          };
        }).toList();
        await bulkCreateTags(tagsCreationReq);
      }
    } catch (e) {
      toast("An error occurred while managing tags.");
    }
  }

  Future<void> deleteTodo({required TodoEntity todoData}) async {
    DeleteTodoParam deleteParam = DeleteTodoParam(
      firebaseId: todoData.firebaseTodoId.validate(),
      localId: todoData.todoId.validate().toString(),
    );

    try {
      add(LoadingEvent());
      tempTodoList.remove(todoData);
      await GetIt.instance<DeleteTodoUseCase>()(deleteParam).then((value) {
        add(InitTodoEvent(isListUpdated: true));
      });
    } catch (e, s) {
      add(InitTodoEvent(isListUpdated: false));
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
      "priority": todoPage.priority,
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
      final Map<String, String> map = {'todo_id': todoPage.todoId.validate(), 'firebase_todo_id': todoPage.firebaseTodoId.validate()};
      _createAndUpdateTags(map, todoPage);
      add(InitTodoEvent(isListUpdated: true));
    });
  }
}
