import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/core/network/internetConnection/internet_connection_cubit.dart';

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
    final todoBloc = context.read<TodoBloc>();
    final scaffoldKey = useMemoized(() => GlobalKey<ScaffoldState>(), []);

    useEffect(
      () {
        return updateStateAccordingToInternetStatus(
          context,
          onInternetIsConnected: () {
            todoBloc.add(InitTodoEvent(isListUpdated: false));
          },
          onInternetIsNotConnected: () {
            todoBloc.add(NoInternetConnectionEvent());
          },
        );
      },
      [todoBloc],
    );

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(),
        endDrawer: const DrawerComponent(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: BlocBuilder<TodoBloc, TodoState>(
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
              builder: (_, state) {
                if (todoBloc.tempTodoList.isNotEmpty) return TodoListComponent(todoList: todoBloc.tempTodoList);
                return EmptyWidget(msg: 'no_to_do_items_available'.tr());
              },
            ),
          ),
        ),
      ),
    );
  }
}
