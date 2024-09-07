import 'package:todo_app/core/app_library.dart';

class TodoListComponent extends StatelessWidget {
  final List<TodoEntity> todoList;

  const TodoListComponent({super.key, required this.todoList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: RefreshIndicator(
        onRefresh: () {
          context.read<TodoBloc>().add(InitTodoEvent(isListUpdated: true));
          return Future(() => true);
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
                final actionHandler = TodoActionHandler(context, todoData);

                return TodoListItemComponent(
                  key: key,
                  uniqueKey: key,
                  todoData: todoData,
                  onPress: actionHandler.onTapTodo,
                  onChanged: actionHandler.onUpdateCheckBoxValue,
                  onTapOfEdit: actionHandler.onTapOfEdit,
                  onTapOfSee: actionHandler.onTapOfSee,
                  onDismissed: actionHandler.onSwipeOfTodo,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
