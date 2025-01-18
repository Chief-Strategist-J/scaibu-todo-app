import 'package:todo_app/core/app_library.dart';

class TodoListComponent extends StatelessWidget {
  const TodoListComponent({required this.todoList, super.key});

  final List<TodoEntity> todoList;

  @override
  Future<Widget> build(final BuildContext context) async => Padding(
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
                itemCount: todoList.length,
                itemBuilder: (final BuildContext context, final int index) {
                  final TodoEntity todoData = todoList[index];
                  final ValueKey<int?> key = ValueKey<int?>(todoData.todoId);
                  final TodoActionHandler actionHandler =
                      TodoActionHandler(context, todoData);

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
