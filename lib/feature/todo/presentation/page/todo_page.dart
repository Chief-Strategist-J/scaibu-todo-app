import 'package:todo_app/core/todo_library.dart';

var voidParameter;

class TodoPage extends StatefulWidget {
  const TodoPage();

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    context.read<TodoBloc>().getList(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (_, state) {

            if(state is LoadingState) return const LoadingWidget();
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
            await context.push(ApplicationPaths.createTodoPage);
            context.read<TodoBloc>().getList(context);
          },
        ),
      ),
    );
  }
}
