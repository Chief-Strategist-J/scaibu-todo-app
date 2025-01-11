import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/core/network/internetConnection/internet_connection_cubit.dart';

/// A const constructor for TodoPage extending HookWidget,
/// accepting a key parameter for widget identification.
class TodoPage extends HookWidget {
  /// A const constructor for TodoPage with a key parameter.
  const TodoPage({super.key});

  void _handleDrawerDrag(
    final DragUpdateDetails details,
    final GlobalKey<ScaffoldState> scaffoldKey,
  ) {
    if (details.delta.dx < -5) {
      scaffoldKey.currentState?.openEndDrawer(); // -5 is sensitivity
    }
  }

  Future<void> _addTodoTap(
    final BuildContext context,
    final TodoBloc todoBloc,
  ) async {
    await GoRouter.of(context).push(ApplicationPaths.manageTodoPage);
  }

  @override
  Widget build(final BuildContext context) {
    final TodoBloc todoBloc = context.read<TodoBloc>();
    final GlobalKey<ScaffoldState> scaffoldKey =
        useMemoized(GlobalKey<ScaffoldState>.new, <Object?>[]);

    useEffect(
      () => updateStateAccordingToInternetStatus(
        context,
        onInternetIsConnected: () {
          todoBloc.add(InitTodoEvent());
        },
        onInternetIsNotConnected: () {
          todoBloc.add(NoInternetConnectionEvent());
        },
      ),
      <Object?>[todoBloc],
    );

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(),
        endDrawer: const DrawerComponent(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: BlocBuilder<TodoBloc, TodoState>(
          builder: (final BuildContext context, final TodoState state) {
            if (state is NoInternetState) {
              return const Offstage();
            }

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
          onHorizontalDragUpdate: (final DragUpdateDetails details) {
            _handleDrawerDrag(details, scaffoldKey);
          },
          child: SizedBox(
            height: context.height(),
            child: BlocBuilder<TodoBloc, TodoState>(
              builder: (final _, final TodoState state) {
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
