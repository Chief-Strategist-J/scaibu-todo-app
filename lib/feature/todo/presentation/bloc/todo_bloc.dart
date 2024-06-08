import 'dart:async';

import 'package:todo_app/core/todo_library.dart';
import 'package:todo_app/feature/todo/domain/useCases/delete_todo_use_case.dart';

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
    List<TodoEntity> todoList = event.todoList ?? [];

    if (todoList.isEmpty) {
      try {
        if (firebaseRepo != null) {
          todoList = await firebaseRepo?.getListOfTodos() ?? [];
        } else if (serverRepo != null) {
          todoList = await serverRepo?.getListOfTodos() ?? [];
        }
      } catch (e) {
        log('Error fetching todo list: $e');
      }
    }

    emit(InitTodoState(todoList: todoList));
  }

  Future<void> getList(BuildContext context) async {
    try {
      final getTodoListUseCase = GetIt.instance<GetTodoListUseCase>();
      final res = await getTodoListUseCase(voidParameter);

      res.fold((failure) {
        logService.crashLog(errorMessage: 'Failed to fetch todo list');
      }, (todoList) {
        context.read<TodoBloc>().add(InitEvent(todoList));
      });

      //
    } catch (e, s) {
      logService.crashLog(errorMessage: 'Failed to fetch todo list', stack: s);
    }
  }

  Future<void> onCheckboxChange({
    required int index,
    bool checked = false,
    required List<TodoEntity> list,
  }) async {
    try {
      final updateTodoUseCase = GetIt.instance<UpdateTodoUseCase>();
      final TodoEntity todoItem = list[index];

      final Map<String, dynamic> todoData = {
        'todo_id': todoItem.todoId.toString(),
        'is_completed': checked.validate(),
      };

      final updateTodo = UpdateTodoParam(
        firebaseID: todoItem.firebaseTodoId.validate(),
        localID: todoItem.todoId.toString(),
        todoData: todoData,
      );

      await updateTodoUseCase.call(updateTodo);
      add(InitEvent([]));
    } catch (e, s) {
      logService.crashLog(errorMessage: 'Error while updating todo', stack: s);
    }
  }

  Future<void> onArchivedTodo({
    required int index,
    required List<TodoEntity> list,
    required final DismissDirection direction,
  }) async {
    if (direction == DismissDirection.startToEnd) {
      try {
        final updateTodoUseCase = GetIt.instance<UpdateTodoUseCase>();
        final TodoEntity todoItem = list[index];

        final Map<String, dynamic> todoData = {
          'todo_id': todoItem.todoId.toString(),
          'is_archived': true,
        };

        final updateTodo = UpdateTodoParam(
          firebaseID: todoItem.firebaseTodoId.validate(),
          localID: todoItem.todoId.toString(),
          todoData: todoData,
        );

        await updateTodoUseCase.call(updateTodo);
        add(InitEvent([]));
      } catch (e, s) {
        logService.crashLog(errorMessage: 'Error while updating todo',e: e, stack: s);
      }
    }
  }

  Future<void> createTodo(
    TextEditingController titleController,
    TextEditingController descriptionController,
  ) async {
    try {
      final createTodoUseCase = GetIt.instance<CreateTodoUseCase>();

      final Map<String, dynamic> todo = {
        "title": titleController.text,
        "description": descriptionController.text,
        "is_archived": false,
        "is_completed": false,
      };

      await createTodoUseCase.call(todo);
    } catch (e, s) {
      logService.crashLog(errorMessage: 'An error occurred: $e', e: e, stack: s);
    }
  }

  Future<void> onDismissDelete({
    required DismissDirection direction,
    required TodoEntity todoData,
  }) async {
    if (direction == DismissDirection.endToStart) {
      final deleteTodoUseCase = GetIt.instance<DeleteTodoUseCase>();

      DeleteTodoParam deleteParam = DeleteTodoParam(
        firebaseId: todoData.firebaseTodoId.validate(),
        localId: todoData.todoId.validate().toString(),
      );

      try {
        await deleteTodoUseCase.call(deleteParam);
      } catch (e, s) {
        logService.crashLog(errorMessage: 'Error while deleting todo', stack: s);
      }
      add(InitEvent([]));
    }
  }
}
