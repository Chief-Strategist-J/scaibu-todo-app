import 'package:todo_app/core/app_library.dart';

class TodoPage extends HookWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final todoBloc = useMemoized(() => GetIt.instance<TodoBloc>(), []);

    useEffect(() {
      todoBloc.add(InitEvent(const []));
      return null;
    }, [todoBloc]);

    return SafeArea(
      child: PopScope(
        canPop: false,
        child: Scaffold(
          body: BlocBuilder<TodoBloc, TodoState>(
            bloc: todoBloc,
            builder: (_, state) {
              if (state is LoadingState) return const LoadingWidget();

              if (state is InitTodoState) {
                final todoList = state.todoList ?? [];

                if (state.todoList == null || todoList.isEmpty) {
                  return EmptyWidget(msg: 'no_to_do_items_available'.tr());
                }

                return TodoListComponent(todoList: todoList);
              }

              if (state is NoInternetConnectionState) {
                final todoList = state.todoList ?? [];

                if (state.todoList == null || todoList.isEmpty) {
                  return EmptyWidget(msg: 'no_to_do_items_available'.tr());
                }
                return TodoListComponent(todoList: todoList);
              }

              return EmptyWidget(msg: 'no_to_do_items_available'.tr());
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: BlocBuilder<TodoBloc, TodoState>(
            bloc: todoBloc,
            builder: (context, state) {
              if (state is LoadingState) return const Offstage();
              if (state is NoInternetConnectionState) return const Offstage();

              if (state is InitTodoState) {
                return FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () async {
                    if (!isInternetConnected) {
                      toast("connect_to_the_internet_to_create_a_to_do_list".tr());
                      todoBloc.add(NoInternetConnectionEvent());
                      return;
                    }

                    context.go(ApplicationPaths.manageTodoPage, extra: null);
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
