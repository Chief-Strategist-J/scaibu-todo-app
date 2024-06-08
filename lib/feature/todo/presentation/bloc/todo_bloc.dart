import 'package:todo_app/core/todo_library.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository? fireTodo;
  final TodoRepository? serverTodo;

  TodoBloc({required this.serverTodo, required this.fireTodo}) : super(InitTodoState.init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<TodoState> emit) async {
    List<TodoEntity> combinedList = event.todoList ?? [];

    if (combinedList.isNotEmpty) {
      emit(InitTodoState(todoList: combinedList));
      return;
    }
    if (fireTodo != null) {
      combinedList = await fireTodo?.getListOfTodos() ?? [];
      return;
    }
    if (serverTodo != null) {
      combinedList = await serverTodo?.getListOfTodos() ?? [];
      return;
    }

    emit(InitTodoState(todoList: combinedList));
  }

  Future<void> onTapOfCreateTodo(BuildContext context) async {
    await context.push(ApplicationPaths.createTodoPage);

    /// TODO : Change this later and convert into dependency injection
    final firebaseTodo = TodoRepositoryImpl(FirebaseApiImpl());
    final serverTodo = TodoRepositoryImpl(LocalApiImpl(RestApiImpl()));

    final res = await GetTodoListUseCase(
      firebaseRepo: firebaseTodo,
      databaseRepo: serverTodo,
    ).call(voidParameter);

    res.fold((failure) {}, (todoList) {
      context.read<TodoBloc>().add(InitEvent(todoList));
    });
  }
}
