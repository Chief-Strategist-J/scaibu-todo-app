import 'package:todo_app/core/todo_library.dart';

class TodoListComponent extends StatelessWidget {
  final List<TodoEntity> todoList;

  const TodoListComponent({super.key, required this.todoList});

  void _onChanged(BuildContext context, int index, bool? value) {
    final bloc = context.read<TodoBloc>();
    bloc.onCheckboxChange(index: index, list: todoList, checked: value.validate());
  }

  Future<void> _onDelete(BuildContext context, DismissDirection direction, TodoEntity todoData) async {
    final bloc = context.read<TodoBloc>();
    await bloc.onDismissDelete(direction: direction, todoData: todoData);
  }

  Future<void> _onArchived(
    BuildContext context,
    TodoEntity todoData,
    DismissDirection direction,
    int index,
  ) async {
    final bloc = context.read<TodoBloc>();
    todoList.remove(todoData);
    await bloc.onArchivedTodo(direction: direction, index: index, list: todoList);
  }

  Future<void> _onTapOfEdit(BuildContext context, TodoEntity todoData) async {
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
    context.read<TodoBloc>().add(InitEvent([], isListUpdated: true));
  }

  Future<void> _onRefresh(BuildContext context) {
    final bloc = context.read<TodoBloc>();
    bloc.add(InitEvent([]));
    return Future(() => true);
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
                  onChanged: (value) {
                    _onChanged(context, index, value);
                  },
                  onDismissed: (direction) async {
                    await _onDelete(context, direction, todoData);
                    await _onArchived(context, todoData, direction, index);
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
