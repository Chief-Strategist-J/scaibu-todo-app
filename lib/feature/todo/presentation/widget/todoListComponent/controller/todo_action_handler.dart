import 'package:todo_app/core/app_library.dart';

class TodoActionHandler {
  final BuildContext context;
  final TodoEntity todoData;
  final TodoBloc todoBloc;

  TodoActionHandler(this.context, this.todoData) : todoBloc = context.read<TodoBloc>();

  bool get isLoading => todoBloc.state is LoadingState;

  bool get hasNoInternet => todoBloc.state is NoInternetState;

  void onUpdateCheckBoxValue(bool? checked) {
    if (_showLoadingIfNeeded()) return;

    todoBloc.updateCheckBoxValue(checked: checked.validate(), todoItem: todoData);
  }

  Future<void> onSwipeOfTodo(DismissDirection direction) async {
    if (_showLoadingIfNeeded()) return;

    if (direction == DismissDirection.endToStart) {
      await todoBloc.deleteTodo(todoData: todoData);
    } else if (direction == DismissDirection.startToEnd) {
      await todoBloc.archiveTodo(todoItem: todoData);
    }
  }

  Future<void> onTapOfEdit() async {
    if (_showLoadingIfNeeded()) return;

    await _navigateToManageTodoPage();
    todoBloc.add(InitEvent(isListUpdated: true));
  }

  Future<void> onTapTodo() async {
    if (hasNoInternet) await _navigateToManageTodoPage();
  }

  void onTapOfSee() {
    GoRouter.of(context).push(ApplicationPaths.pomodoroPage);
  }

  bool _showLoadingIfNeeded() {
    return isLoading ? true : false;
  }

  Future<void> _navigateToManageTodoPage() async {
    await GoRouter.of(context).push(ApplicationPaths.manageTodoPage, extra: ManageTodoPageParam.fromTodoEntity(todoData));
  }
}
