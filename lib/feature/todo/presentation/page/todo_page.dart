
import 'package:todo_app/core/routes/route_service.dart';
import 'package:todo_app/core/todo_library.dart';
import 'package:todo_app/feature/todo/presentation/bloc/todo_bloc.dart';
import 'package:todo_app/feature/todo/presentation/bloc/todo_event.dart';

class TodoPage extends StatelessWidget {
  void _onTapOfCreateTodo(BuildContext context) {
    context.go(Path.createTodoPage);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TodoBloc()..add(InitEvent()),
      child: Builder(
        builder: (context) {
          final bloc = BlocProvider.of<TodoBloc>(context);

          return Scaffold(
            body: Container(),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                _onTapOfCreateTodo(context);
              },
            ),
          );
        },
      ),
    );
  }
}
