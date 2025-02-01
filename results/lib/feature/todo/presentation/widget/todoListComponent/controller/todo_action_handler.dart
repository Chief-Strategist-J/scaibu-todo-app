import 'package:todo_app/core/app_library.dart';

/// Doc Required
class TodoActionHandler {
  /// Doc Required
  TodoActionHandler(this._context, this._todoData)
      : _todoBloc = _context.read<TodoBloc>();

  final BuildContext _context;
  final TodoEntity _todoData;
  final TodoBloc _todoBloc;

  /// Doc Required
  bool get isLoading => _todoBloc.state is LoadingState;

  /// Doc Required
  bool get hasNoInternet => _todoBloc.state is NoInternetState;

  /// Doc Required
  Future<void> onUpdateCheckBoxValue({final bool? checked}) async {
    if (_showLoadingIfNeeded()) {
      return;
    }

    await _todoBloc.updateCheckBoxValue(
      checked: checked.validate(),
      todoItem: _todoData,
    );
  }

  /// Doc Required
  Future<void> onSwipeOfTodo(final DismissDirection direction) async {
    if (_showLoadingIfNeeded()) {
      return;
    }

    if (direction == DismissDirection.endToStart) {
      await _todoBloc.deleteTodo(todoData: _todoData);
    } else if (direction == DismissDirection.startToEnd) {
      await _todoBloc.archiveTodo(todoItem: _todoData);
    }
  }

  /// Doc Required
  Future<void> onTapOfEdit() async {
    if (_showLoadingIfNeeded()) {
      return;
    }

    await _navigateToManageTodoPage();
    _todoBloc.add(InitTodoEvent(isListUpdated: true));
  }

  /// Doc Required
  Future<void> onTapTodo() async {
    if (hasNoInternet) {
      await _navigateToManageTodoPage();
    }
  }

  /// Doc Required
  Future<void> onTapOfSee() async {
    await GoRouter.of(_context).push(ApplicationPaths.pomodoroPage);
  }

  bool _showLoadingIfNeeded() => isLoading;

  Future<void> _navigateToManageTodoPage() async {
    await GoRouter.of(_context).push(
      ApplicationPaths.manageTodoPage,
      extra: ManageTodoPageParam.fromTodoEntity(_todoData),
    );
  }
}
