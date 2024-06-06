import 'package:todo_app/core/todo_library.dart';
import 'package:todo_app/feature/todo/domain/entity/todo_entity.dart';

var voidParameter;

class TodoPage extends StatelessWidget {
  const TodoPage();

  TodoBloc _todoBloc(BuildContext context) => context.read<TodoBloc>();

  Future<void> _init(BuildContext context) async {
    /// Change this later after
    final firebaseTodo = TodoRepositoryImpl(FirebaseApiImpl());
    final serverTodo = TodoRepositoryImpl(LocalApiImpl(RestApiImpl()));

    final getTodoListUseCase = GetTodoListUseCase(firebaseServer: firebaseTodo, server: serverTodo);
    final res = await getTodoListUseCase.call(voidParameter);

    res.fold((failure) {}, (todoList) {
      _todoBloc(context).add(InitEvent(todoList));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (_, state) {
            if (state is InitTodoState) {
              if (state.todoList == null) return Offstage();

              final todoList = state.todoList ?? [];
              if (todoList.isEmpty) {
                return const Center(child: Text('No todos available'));
              }

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
                                    Text("Title : ${todoList[index].title ?? ''}"),
                                    4.height,
                                    Text("Description : ${todoList[index].description ?? ''}"),
                                  ],
                                ),
                              ),
                              Checkbox(
                                value: todoList[index].isCompleted ?? false,
                                onChanged: (value) {
                                  todoList[index].isCompleted = value;
                                  _todoBloc(context).add(InitEvent(todoList));
                                },
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator()); // Show loading indicator
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await context.push(ApplicationPaths.createTodoPage);
            await _init(context);
          },
        ),
      ),
    );
  }
}
