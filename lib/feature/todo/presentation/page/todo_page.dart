import 'package:todo_app/core/network/network_service.dart';
import 'package:todo_app/core/routes/route_service.dart';
import 'package:todo_app/core/todo_library.dart';
import 'package:todo_app/feature/todo/data/dataSource/firebase_api_impl.dart';
import 'package:todo_app/feature/todo/data/dataSource/local_api_impl.dart';
import 'package:todo_app/feature/todo/data/repository/todo_repository_impl.dart';
import 'package:todo_app/feature/todo/domain/useCases/get_todo_list_use_case.dart';
import 'package:todo_app/feature/todo/presentation/bloc/todo_bloc.dart';
import 'package:todo_app/feature/todo/presentation/bloc/todo_event.dart';
import 'package:todo_app/feature/todo/presentation/bloc/todo_state.dart';

class TodoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            final bloc = context.read<TodoBloc>();

            if (state is InitTodoState) {
              if (state.todoList == null) return Offstage();

              if (state.todoList!.isEmpty) {
                return Center(child: Text('No todos available'));
              }

              return ListView.builder(
                itemCount: state.todoList!.length,
                padding: EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  return Text("Index ${index.toString()} : ${state.todoList![index].firebaseTodoId ?? ''}");
                },
              );
            } else {
              return Center(child: CircularProgressIndicator()); // Show loading indicator
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // context.push(ApplicationPaths.createTodoPage);


            await init(context);
          },
        ),
      ),
    );
  }

  Future<void> init(BuildContext context) async {
    final getTodoListUseCase = GetTodoListUseCase(
      firebaseTodo: TodoRepositoryImpl(FirebaseApiImpl()),
      serverTodo: TodoRepositoryImpl(LocalApiImpl(RestApiImpl())),
    );

    var params;
    final res = await getTodoListUseCase.call(params);

    res.fold((failure) {
      print("Failed to fetch todo list");
    }, (todoList) {
      print("Fetched todo list with ${todoList.length} items");
      context.read<TodoBloc>().add(InitEvent(todoList));
    });
  }
}
