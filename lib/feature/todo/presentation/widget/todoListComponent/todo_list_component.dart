import 'package:todo_app/core/app_library.dart';

/// Doc Required
class TodoListComponent extends StatelessWidget {
  /// Doc Required
  const TodoListComponent({required final List<TodoEntity> todoList, super.key})
      : _todoList = todoList;

  final List<TodoEntity> _todoList;

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: RefreshIndicator(
          onRefresh: () {
            context.read<TodoBloc>().add(InitTodoEvent(isListUpdated: true));
            return Future<bool>(() => true);
          },
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            restorationId: '_todoList',
            shrinkWrap: true,
            cacheExtent: 50,
            semanticChildCount: 2,
            slivers: <Widget>[
              SliverList.builder(
                itemCount: _todoList.length,
                itemBuilder: (final BuildContext context, final int index) {
                  final TodoEntity todoData = _todoList[index];
                  final ValueKey<int?> key = ValueKey<int?>(todoData.todoId);
                  final TodoActionHandler actionHandler =
                      TodoActionHandler(context, todoData);

                  return TodoListItemComponent(
                    key: key,
                    uniqueKey: key,
                    todoData: todoData,
                    onPress: actionHandler.onTapTodo,
                    onChanged: (final bool? value) async {
                      await actionHandler.onUpdateCheckBoxValue(checked: value);
                    },
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
