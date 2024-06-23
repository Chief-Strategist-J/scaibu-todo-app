import 'package:todo_app/core/app_library.dart';

class TodoListComponent extends StatelessWidget {
  final List<TodoEntity> todoList;

  const TodoListComponent({super.key, required this.todoList});

  TodoBloc todoBloc(BuildContext context) => context.read<TodoBloc>();

  void _onUpdateCheckBoxValue(BuildContext context, {bool? checked, required TodoEntity todoData}) {
    if (!isInternetConnected) {
      context.read<TodoBloc>().add(NoInternetConnectionEvent());
      toast("Connect to the internet");
      return;
    }

    if (todoBloc(context).state == LoadingState) {
      toast("Loading please wait ...");
      return;
    }

    todoBloc(context).updateCheckBoxValue(checked: checked.validate(), todoItem: todoData);
  }

  Future<void> _deleteTodo(BuildContext context, TodoEntity todoData) async {
    await todoBloc(context).deleteTodo(todoData: todoData);
  }

  Future<void> _archiveTodo(BuildContext context, TodoEntity todoData) async {
    await todoBloc(context).archiveTodo(todoItem: todoData);
  }

  Future<void> _onRefresh(BuildContext context) {
    if (!isInternetConnected) {
      context.read<TodoBloc>().add(NoInternetConnectionEvent());
      toast("Connect to the internet to perform this action");
      return Future(() => false);
    }

    todoBloc(context).add(InitEvent([]));
    return Future(() => true);
  }

  Future<void> _onSwipeOfTodo(DismissDirection direction, BuildContext context, TodoEntity todoData, int index) async {
    if (!isInternetConnected) {
      context.read<TodoBloc>().add(NoInternetConnectionEvent());
      toast("Connect to the internet to perform this action");
      return;
    }
    if (todoBloc(context).state == LoadingState) {
      toast("Loading please wait ...");
      return;
    }

    if (direction == DismissDirection.endToStart) {
      await _deleteTodo(context, todoData);
    } else if (direction == DismissDirection.startToEnd) {
      await _archiveTodo(context, todoData);
    }
  }

  Future<void> _onTapOfEdit(BuildContext context, TodoEntity todoData) async {
    if (!isInternetConnected) {
      context.read<TodoBloc>().add(NoInternetConnectionEvent());
      toast("Connect to the internet to Edit todo");
      return;
    }

    if (todoBloc(context).state == LoadingState) {
      toast("Loading please wait ...");
      return;
    }

    await context.push(
      ApplicationPaths.manageTodoPage,
      extra: ManageTodoPageParam(
        titleController: TextEditingController(text: todoData.title),
        dateController: TextEditingController(text: ''),
        startTimeController: TextEditingController(),
        endTimeController: TextEditingController(),
        descriptionController: TextEditingController(text: todoData.description),
        firebaseTodoId: todoData.firebaseTodoId.validate(),
        todoId: todoData.todoId.validate().toString(),
        isUpdatingExistingTodo: true,
      ),
    );
    todoBloc(context).add(InitEvent([], isListUpdated: true));
  }

  Future<void> _onTapTodo(BuildContext context, TodoEntity todoData) async {
    if (todoBloc(context).state is NoInternetConnectionState) {
      await context.push(
        ApplicationPaths.manageTodoPage,
        extra: ManageTodoPageParam(
          titleController: TextEditingController(text: todoData.title),
          dateController: TextEditingController(text: ''),
          startTimeController: TextEditingController(),
          endTimeController: TextEditingController(),
          descriptionController: TextEditingController(text: todoData.description),
          firebaseTodoId: todoData.firebaseTodoId.validate(),
          todoId: todoData.todoId.validate().toString(),
          isUpdatingExistingTodo: true,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: RefreshIndicator(
        onRefresh: () {
          return _onRefresh(context);
        },
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
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
