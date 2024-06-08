import 'package:todo_app/core/todo_library.dart';

class TodoListComponent extends StatelessWidget {
  final List<TodoEntity> todoList;

  const TodoListComponent({super.key, required this.todoList});

  Future<void> _onCheckboxChange(int index, bool? value, BuildContext context) async {
    try {
      final updateTodoUseCase = GetIt.instance<UpdateTodoUseCase>();

      final Map<String, dynamic> todoData = {
        'todo_id': todoList[index].todoId.toString(),
        'is_completed': value.validate(),
      };

      await updateTodoUseCase.call(
        UpdateTodoParam(
          firebaseID: todoList[index].firebaseTodoId.validate(),
          localID: todoList[index].todoId.toString(),
          todoData: todoData,
        ),
      );

      context.read<TodoBloc>().add(InitEvent([]));
    } catch (e, s) {
      logService.crashLog(errorMessage: 'error while updating todo', stack: s);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: CustomScrollView(
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
                todoData: todoData,
                onChanged: (value) {
                  _onCheckboxChange(index, value, context);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class TodoListItemComponent extends StatelessWidget {
  final TodoEntity todoData;
  final ValueChanged<bool?>? onChanged;

  const TodoListItemComponent({
    super.key,
    required this.todoData,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: boxDecorationWithRoundedCorners(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          AppThemeData.defaultBoxShadow,
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Title : ${todoData.title ?? ''}"),
                4.height,
                Text("Description : ${todoData.description ?? ''}"),
              ],
            ),
          ),
          Checkbox(
            value: todoData.isCompleted ?? false,
            onChanged: onChanged,
          )
        ],
      ),
    );
  }
}
