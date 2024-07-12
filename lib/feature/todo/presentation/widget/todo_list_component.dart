import 'package:todo_app/core/app_library.dart';

class TodoListComponent extends StatelessWidget {
  final List<TodoEntity> todoList;
  final TodoBloc todoBloc;

  const TodoListComponent({
    super.key,
    required this.todoList,
    required this.todoBloc,
  });

  void _onUpdateCheckBoxValue(BuildContext context, {bool? checked, required TodoEntity todoData}) {
    if (todoBloc.state is LoadingState) {
      toast("Loading please wait ...");
      return;
    }

    todoBloc.updateCheckBoxValue(checked: checked.validate(), todoItem: todoData);
  }

  Future<void> _deleteTodo(BuildContext context, TodoEntity todoData) async {
    await todoBloc.deleteTodo(todoData: todoData);
  }

  Future<void> _archiveTodo(BuildContext context, TodoEntity todoData) async {
    await todoBloc.archiveTodo(todoItem: todoData);
  }

  Future<void> _onRefresh(BuildContext context) {
    todoBloc.add(InitEvent(const []));
    return Future(() => true);
  }

  Future<void> _onSwipeOfTodo(DismissDirection direction, BuildContext context, TodoEntity todoData, int index) async {
    if (todoBloc.state is LoadingState) {
      toast("Loading please wait ...");
      return;
    }

    if (direction == DismissDirection.endToStart) {
      // toast("delete is clicked");
      await _deleteTodo(context, todoData);
    } else if (direction == DismissDirection.startToEnd) {
      await _archiveTodo(context, todoData);
    }
  }

  Future<void> _onTapOfEdit(BuildContext context, TodoEntity todoData) async {
    if (todoBloc.state is LoadingState) {
      toast("Loading please wait ...");
      return;
    }

    await GoRouter.of(context).push(
      ApplicationPaths.manageTodoPage,
      extra: ManageTodoPageParam.fromTodoEntity(todoData),
    );
  }

  Future<void> _onTapTodo(BuildContext context, TodoEntity todoData) async {
    if (todoBloc.state is NoInternetState) {
      await GoRouter.of(context).push(
        ApplicationPaths.manageTodoPage,
        extra: ManageTodoPageParam.fromTodoEntity(todoData),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: RefreshIndicator(
        onRefresh: () {
          return _onRefresh(context);
        },
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          restorationId: '_todoList',
          shrinkWrap: true,
          cacheExtent: 50,
          semanticChildCount: 2,
          slivers: [
            SliverList.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                TodoEntity todoData = todoList[index];
                final key = ValueKey(todoData.todoId);

                return TodoListItemComponent(
                  key: key,
                  uniqueKey: key,
                  todoBloc: todoBloc,
                  todoData: todoData,
                  onPress: () {
                    _onTapTodo(context, todoData);
                  },
                  onChanged: (value) {
                    _onUpdateCheckBoxValue(context, checked: value, todoData: todoData);
                  },
                  onDismissed: (direction) async {
                    await _onSwipeOfTodo(direction, context, todoData, index);
                  },
                  onTapOfEdit: () {
                    _onTapOfEdit(context, todoData);
                    todoBloc.add(InitEvent(const [], isListUpdated: true));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
