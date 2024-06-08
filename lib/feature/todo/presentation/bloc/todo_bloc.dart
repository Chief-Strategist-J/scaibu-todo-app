import 'dart:async';

import 'package:get_it/get_it.dart';
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
        log('Failed to fetch todo list: $failure');
      }, (todoList) {
        context.read<TodoBloc>().add(InitEvent(todoList));
      });
    } catch (e) {
      log('An error occurred: $e');
    }
    // /// TODO : Change this later and convert into dependency injection
    // final firebaseTodo = TodoRepositoryImpl(FirebaseApiImpl());
    // final serverTodo = TodoRepositoryImpl(LocalApiImpl(RestApiImpl()));
    //
    // final res = await GetTodoListUseCase(firebaseRepo: firebaseTodo, databaseRepo: serverTodo).call(voidParameter);
    //
    // res.fold((failure) {}, (todoList) {
    //   context.read<TodoBloc>().add(InitEvent(todoList));
    // });
  }
}
