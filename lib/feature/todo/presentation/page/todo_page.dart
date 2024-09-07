import 'package:todo_app/core/app_library.dart';

class TodoPage extends HookWidget {
  const TodoPage({super.key});

  void _handleDrawerDrag(DragUpdateDetails details, GlobalKey<ScaffoldState> scaffoldKey) {
    if (details.delta.dx < -5) scaffoldKey.currentState?.openEndDrawer(); // -5 is sensitivity
  }

  Future<void> _addTodoTap(BuildContext context, TodoBloc todoBloc) async {
    await GoRouter.of(context).push(ApplicationPaths.manageTodoPage);
  }

  @override
  Widget build(BuildContext context) {
    final todoBloc = useMemoized(() => context.read<TodoBloc>(), []);

    final scaffoldKey = useMemoized(() => GlobalKey<ScaffoldState>(), []);

    useEffect(() {
      todoBloc.add(InitTodoEvent(isListUpdated: true));
      return null;
    }, [todoBloc]);

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(),
        endDrawer: DrawerComponent(todoBloc: todoBloc),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: BlocBuilder<TodoBloc, TodoState>(
          bloc: todoBloc,
          builder: (context, state) {
            if (state is NoInternetState) return const Offstage();

            return FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () async {
                await _addTodoTap(context, todoBloc);
              },
            );
          },
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onHorizontalDragUpdate: (details) {
            _handleDrawerDrag(details, scaffoldKey);
          },
          child: SizedBox(
            height: context.height(),
            child: BlocBuilder<TodoBloc, TodoState>(
              bloc: todoBloc,
              builder: (_, state) {


                if (todoBloc.tempTodoList.isNotEmpty) {
                  return TodoListComponent(todoList: todoBloc.tempTodoList);
                }

                return EmptyWidget(msg: 'no_to_do_items_available'.tr());
              },
            ),
          ),
        ),
      ),
    );
  }
}
