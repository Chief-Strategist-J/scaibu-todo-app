import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/todo/presentation/widget/start_drawer.dart';

class TodoPage extends HookWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final todoBloc = useMemoized(() => GetIt.instance<TodoBloc>(), []);
    final scaffoldKey = useMemoized(() => GlobalKey<ScaffoldState>(), []);

    useEffect(() {
      todoBloc.add(InitEvent(const []));
      return null;
    }, [todoBloc]);

    return SafeArea(
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          drawer: StartDrawer(todoBloc: todoBloc),
          endDrawer: StartDrawer(todoBloc: todoBloc),
          body: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onVerticalDragUpdate: (details) {
              int sensitivity = 5;
              if (details.delta.dy > sensitivity) {
              } else if (details.delta.dy < -sensitivity) {}
            },
            onHorizontalDragUpdate: (details) {
              int sensitivity = 5;
              if (details.delta.dx > sensitivity) {
                scaffoldKey.currentState?.openDrawer();
              } else if (details.delta.dx < -sensitivity) {
                scaffoldKey.currentState?.openEndDrawer();
              }
            },
            child: SizedBox(
              height: context.height(),
              child: BlocBuilder<TodoBloc, TodoState>(
                bloc: todoBloc,
                builder: (_, state) {
                  if (state is LoadingState) return const LoadingWidget();

                  if (state is InitTodoState || state is NoInternetConnectionState) {
                    List<TodoEntity> todoList = [];

                    if (state is InitTodoState) {
                      todoList = state.todoList ?? [];
                    } else if (state is NoInternetConnectionState) {
                      todoList = state.todoList ?? [];
                    }

                    if (todoList.isEmpty) {
                      return EmptyWidget(msg: 'no_to_do_items_available'.tr());
                    } else {
                      return TodoListComponent(todoList: todoList, todoBloc: todoBloc);
                    }
                  }

                  return EmptyWidget(msg: 'no_to_do_items_available'.tr());
                },
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: BlocBuilder<TodoBloc, TodoState>(
            bloc: todoBloc,
            builder: (context, state) {
              if (state is InitTodoState) {
                return FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () async {
                    context.push(ApplicationPaths.manageTodoPage, extra: null);
                    todoBloc.add(InitEvent(const []));
                  },
                );
              }

              return const Offstage();
            },
          ),
        ),
      ),
    );
  }
}
