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
    todoList.remove(todoData);
    await bloc.onDismissDelete(direction: direction, todoData: todoData);
  }

  Future<void> _onRefresh(BuildContext context) {
    final bloc = context.read<TodoBloc>();
    bloc.add(InitEvent([]));
    return Future(() => true);
  }

  Future<void> _onArchived(BuildContext context, TodoEntity todoData, DismissDirection direction, int index) async {
    final bloc = context.read<TodoBloc>();
    todoList.remove(todoData);
    await bloc.onArchivedTodo(direction: direction, index: index, list: todoList);
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
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TodoListItemComponent extends StatelessWidget {
  final TodoEntity todoData;
  final ValueChanged<bool?>? onChanged;
  final DismissDirectionCallback? onDismissed;

  final ValueKey uniqueKey;

  const TodoListItemComponent({
    super.key,
    required this.todoData,
    required this.onChanged,
    required this.uniqueKey,
    this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: uniqueKey,
      background: const BackgroundComponent(
        icon: Icons.archive,
        backgroundColor: Colors.green,
      ),
      secondaryBackground: const BackgroundComponent(
        icon: Icons.delete,
        backgroundColor: redColor,
        mainAxisAlignment: MainAxisAlignment.end,
      ),
      onDismissed: onDismissed,
      child: Container(
        margin: EdgeInsets.only(top: 6, bottom: 6),
        padding: EdgeInsets.all(16),
        decoration: boxDecorationWithRoundedCorners(
          borderRadius: BorderRadius.circular(23),
          boxShadow: [
            AppThemeData.defaultBoxShadow,
          ],
        ),
        child: Row(
          children: [
            Checkbox(
              value: todoData.isCompleted ?? false,
              onChanged: onChanged,
            ),
            4.width,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text.rich(
                    TextSpan(
                      text: 'Task : ',
                      style: primaryTextStyle(size: 14),
                      children: [
                        TextSpan(
                          text: todoData.title ?? '',
                          style: boldTextStyle(size: 14),
                        ),
                      ],
                    ),
                  ),
                  4.height,
                  Text.rich(
                    TextSpan(
                      text: 'Description : ',
                      style: primaryTextStyle(size: 14),
                      children: [
                        TextSpan(
                          text: todoData.description ?? '',
                          style: boldTextStyle(size: 14),
                        ),
                      ],
                    ),
                  ),
                  4.height,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.calendar_month, size: 12, color: greenColor),
                      2.width,
                      Text(
                        '2:00 AM',
                        style: boldTextStyle(color: greenColor, size: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.flag, size: 22),
                8.width,
                Icon(Icons.edit, size: 22),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BackgroundComponent extends StatelessWidget {
  final Color backgroundColor;
  final IconData? icon;
  final MainAxisAlignment mainAxisAlignment;

  const BackgroundComponent({
    super.key,
    this.icon,
    this.backgroundColor = whiteColor,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 6),
      decoration: boxDecorationWithRoundedCorners(backgroundColor: Colors.white),
      child: Container(
        decoration: boxDecorationWithRoundedCorners(
          borderRadius: BorderRadius.circular(23),
          backgroundColor: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            if (mainAxisAlignment == MainAxisAlignment.start) 16.width,
            Icon(icon, color: context.primaryColor),
            if (mainAxisAlignment == MainAxisAlignment.end) 16.width,
          ],
        ),
      ),
    );
  }
}
