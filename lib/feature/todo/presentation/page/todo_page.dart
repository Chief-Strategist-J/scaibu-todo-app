import 'package:todo_app/core/todo_library.dart';

class TodoPage extends StatelessWidget {
  const TodoPage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (_, state) {
            if (state is LoadingState) return const LoadingWidget();
            if (state is! InitTodoState) return const LoadingWidget();

            final todoList = state.todoList ?? [];

            if (state.todoList == null || todoList.isEmpty) {
              return const EmptyWidget(msg: 'No todo available');
            }

            return TodoListComponent(todoList: todoList);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await context.push(ApplicationPaths.manageTodoPage, extra: null);
            context.read<TodoBloc>().getList(true);
          },
        ),
      ),
    );
  }
}
