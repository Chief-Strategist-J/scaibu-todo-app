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
              return EmptyWidget(msg: 'no_to_do_items_available'.tr());
            }

            return TodoListComponent(todoList: todoList);
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            if (!isInternetConnected) {
              toast("connect_to_the_internet_to_create_a_to_do_list".tr());
              return;
            }
            context.go(ApplicationPaths.manageTodoPage, extra: null);
          },
        ),
      ),
    );
  }
}
