import 'package:todo_app/core/app_library.dart';

///Manages the state and events for to-do operations, including initialization,
/// loading, and handling no internet connection, using the BLoC pattern.
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  /// The constructor for TodoBloc, initializing the state to
  /// InitTodoState.init() and setting up event handlers for InitTodoEvent,
  /// LoadingEvent, and NoInternetConnectionEvent.
  TodoBloc() : super(InitTodoState.init()) {
    on<InitTodoEvent>(_init);
    on<LoadingEvent>(_onLoadingEvent);
    on<NoInternetConnectionEvent>(_onNoInternetConnectionUpdate);
  }

  ///A temporary list that stores TodoEntity items for in-memory operations,
  /// such as adding, removing, or updating to-do tasks.
  List<TodoEntity> tempTodoList = <TodoEntity>[];

  Future<void> _onNoInternetConnectionUpdate(
    final NoInternetConnectionEvent event,
    final Emitter<TodoState> emit,
  ) async {
    emit(NoInternetState(todoList: tempTodoList));
  }

  Future<void> _onLoadingEvent(
    final LoadingEvent event,
    final Emitter<TodoState> emit,
  ) async {
    emit(LoadingState());
  }

  Future<void> _init(
      final InitTodoEvent event, final Emitter<TodoState> emit) async {
    try {
      log('GETTING THE TODO-LIST');
      await GetIt.instance<GetTodoListUseCase>()(event.isListUpdated)
          .then((final Either<Failure, List<TodoEntity>> res) {
        res.fold((final Failure failure) {
          logService.crashLog(
              errorMessage: 'Failed to fetch todo list', e: Object());
        }, (final List<TodoEntity> todoList) {
          tempTodoList = todoList;
          emit(InitTodoState(todoList: tempTodoList));
        });
      });
    } catch (e, s) {
      logService.crashLog(
          errorMessage: 'Error initializing bloc', e: e, stack: s);
    }
  }

  /// Updates the completion status of a to-do item based on the checkbox value
  /// and refreshes the list, with error handling and logging for failures.
  Future<void> updateCheckBoxValue({
    required final TodoEntity todoItem,
    final bool checked = false,
  }) async {
    try {
      final Map<String, dynamic> todoData = <String, dynamic>{
        'todo_id': todoItem.todoId.toString(),
        'is_completed': checked.validate(),
      };

      final UpdateTodoParam updateTodo = UpdateTodoParam(
        firebaseID: todoItem.firebaseTodoId.validate(),
        localID: todoItem.todoId.toString(),
        todoData: todoData,
      );

      add(LoadingEvent());
      await GetIt.instance<UpdateTodoUseCase>()(updateTodo)
          .then((final Either<Failure, void> value) {
        add(InitTodoEvent(isListUpdated: true));
      });
    } catch (e, s) {
      add(InitTodoEvent());
      logService.crashLog(
          errorMessage: 'Error while updating todo', e: e, stack: s);
    }
  }

  /// Archives a to-do item by updating its status to archived and refreshes the
  /// list, with error handling and logging for failures.
  Future<void> archiveTodo({required final TodoEntity todoItem}) async {
    try {
      final Map<String, dynamic> todoData = <String, dynamic>{
        'todo_id': todoItem.todoId.toString(),
        'is_archived': true,
      };

      final UpdateTodoParam updateTodo = UpdateTodoParam(
        firebaseID: todoItem.firebaseTodoId.validate(),
        localID: todoItem.todoId.toString(),
        todoData: todoData,
      );

      add(LoadingEvent());
      await GetIt.instance<UpdateTodoUseCase>()(updateTodo)
          .then((final Either<Failure, void> value) {
        add(InitTodoEvent(isListUpdated: true));
      });
    } catch (e, s) {
      add(InitTodoEvent());
      logService.crashLog(
          errorMessage: 'Error while updating todo', e: e, stack: s);
    }
  }

  /// Creates a new to-do item with the provided details and sets
  /// default values for its status (archived, completed).
  Future<void> createTodo({
    required final ManageTodoPageParam todoDetail,
  }) async {
    final Map<String, dynamic> todo = <String, dynamic>{
      'title': todoDetail.title.text,
      'description': todoDetail.description.text,
      'is_archived': false,
      'is_completed': false,
      'notes': todoDetail.note.text,
      'priority': todoDetail.priority,
    };

    if (todoDetail.startTime != null) {
      todo.putIfAbsent(
        'start_time',
        () => todoDetail.startTime?.dateTime.toString(),
      );
    }
    if (todoDetail.endTime != null) {
      todo.putIfAbsent(
        'end_time',
        () => todoDetail.endTime?.dateTime.toString(),
      );

      if (todoDetail.isWantToDeleteTodoAtEndTime) {
        todo.putIfAbsent(
          'is_want_to_delete_todo_at_end_time',
          () => todoDetail.isWantToDeleteTodoAtEndTime,
        );
      }
    }
    if (todoDetail.date != null) {
      todo.putIfAbsent('date', () => todoDetail.date?.dateTime.toString());
    }

    if (userCredentials.getIsLogin.validate()) {
      todo.putIfAbsent('created_by', () => userCredentials.getUserId);
    }

    try {
      add(LoadingEvent());
      await GetIt.instance<CreateTodoUseCase>()(todo)
          .then((final Either<Failure, Map<String, dynamic>> value) async {
        await value.fold((final Failure failure) {},
            (final Map<String, dynamic> map) async {
          // TO-DO : currently we are making request in part but in future
          //  we are going to merge
          // all request and making only one request combine
          // to-do creating request
          // combineTodoCreation =
          //  createTodo + createAndUpdateTags + createPomodoros
          await _createAndUpdateTags(map, todoDetail);
          await _createPomodoros(todoDetail, map);
        });

        add(InitTodoEvent(isListUpdated: true));
      });
    } catch (e, s) {
      add(InitTodoEvent());
      logService.crashLog(
          errorMessage: 'An error occurred: $e', e: e, stack: s);
    }
  }

  Future<void> _createPomodoros(
    final ManageTodoPageParam todoDetail,
    final Map<String, dynamic> map,
  ) async {
    final String todoId = map['todo_id'] as String;

    if (todoDetail.pomodorowDuration.value == 0 ||
        todoDetail.pomodorowCount.value == 0) {
      return;
    }

    final Map<String, dynamic> request = <String, dynamic>{
      'todo_id': todoId,
      'title': todoDetail.title.text,
      'user_id': userCredentials.getUserId,
      'duration': todoDetail.pomodorowDuration.value,
      'number_of_pomodoros': todoDetail.pomodorowCount.value,
      'status': 'pending',
    };
    try {
      final CreatePomodoroUseCase createPomodoro = getIt<CreatePomodoroUseCase>(
          instanceName: PomodoroDependencyInjection.createPomodoroUseCase);
      await createPomodoro(request);
      toast('added');
    } catch (e) {
      logService.crashLog(errorMessage: 'An error occurred: $e', e: e);
    }
  }

  Future<void> _createAndUpdateTags(
    final Map<String, dynamic> map,
    final ManageTodoPageParam todoDetail,
  ) async {
    final String todoId = map['todo_id'] as String;

    final BulkDeleteTagsByTodoIdUseCase deleteTagsByTodoId =
        getIt<BulkDeleteTagsByTodoIdUseCase>(
      instanceName: TagsDependencyInjection.bulkDeleteTagsByTodoIdUseCase,
    );

    final BulkCreateTagsUseCase bulkCreateTags = getIt<BulkCreateTagsUseCase>(
      instanceName: TagsDependencyInjection.bulkCreateTagsUseCase,
    );

    final num? userId = userCredentials.getUserId;

    try {
      if (todoDetail.tags.isEmpty) {
        await deleteTagsByTodoId(todoId);
      } else {
        final List<Map<String, dynamic>> tagsCreationReq = todoDetail.tags
            .map(
              (final TagEntity tag) => <String, dynamic>{
                'todo_id': todoId,
                'created_by': userId,
                'name': tag.name,
                'color': tag.color,
              },
            )
            .toList();

        await bulkCreateTags(tagsCreationReq);
      }
    } catch (e) {
      toast('An error occurred while managing tags.');
    }
  }

  /// Deletes a to-do item from the system and updates the list,
  /// handling errors and logging failures during the process.
  Future<void> deleteTodo({required final TodoEntity todoData}) async {
    final DeleteTodoParam deleteParam = DeleteTodoParam(
      firebaseId: todoData.firebaseTodoId.validate(),
      localId: todoData.todoId.validate().toString(),
    );

    try {
      add(LoadingEvent());
      tempTodoList.remove(todoData);
      await GetIt.instance<DeleteTodoUseCase>()(deleteParam).then(
        (final Either<Failure, void> value) {
          add(InitTodoEvent(isListUpdated: true));
        },
      );
    } catch (e, s) {
      add(InitTodoEvent());
      logService.crashLog(
        errorMessage: 'Error while deleting todo',
        e: e,
        stack: s,
      );
    }
  }

  /// Updates the details of a to-do item in the system based on the
  /// provided parameters from the manage to-do page.
  Future<void> onEditPageUpdateTodo(final ManageTodoPageParam todoPage) async {
    if (todoPage.firebaseTodoId.validate().isEmpty ||
        todoPage.todoId.validate().isEmpty) {
      return;
    }

    final Map<String, dynamic> todoData = <String, dynamic>{
      'todo_id': todoPage.todoId,
      'title': todoPage.title.text,
      'description': todoPage.description.text,
      'notes': todoPage.note.text,
      'priority': todoPage.priority,
    };

    if (todoPage.startTime != null) {
      todoData.putIfAbsent(
        'start_time',
        () => todoPage.startTime?.dateTime.toString(),
      );
    }
    if (todoPage.endTime != null) {
      todoData.putIfAbsent(
        'end_time',
        () => todoPage.endTime?.dateTime.toString(),
      );
    }

    if (todoPage.date != null) {
      todoData.putIfAbsent('date', () => todoPage.date?.dateTime.toString());
    }

    final UpdateTodoParam updateTodo = UpdateTodoParam(
      firebaseID: todoPage.firebaseTodoId.validate(),
      localID: todoPage.todoId.validate(),
      todoData: todoData,
    );

    add(LoadingEvent());
    await GetIt.instance<UpdateTodoUseCase>()(updateTodo).then((
      final Either<Failure, void> value,
    ) {
      final Map<String, String> map = <String, String>{
        'todo_id': todoPage.todoId.validate(),
        'firebase_todo_id': todoPage.firebaseTodoId.validate(),
      };
      _createAndUpdateTags(map, todoPage);
      add(InitTodoEvent(isListUpdated: true));
    });
  }
}
