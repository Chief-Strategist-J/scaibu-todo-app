import 'package:todo_app/core/app_library.dart';

class DrawerComponent extends HookWidget {
  const DrawerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final todoBloc = BlocProvider.of<TodoBloc>(context);
    final todoState = useStream(todoBloc.stream, initialData: todoBloc.state);

    final _drawerItems = useMemoized(() => DrawerItemModel.itemList(context));

    final visibleItems = useMemoized(
      () {
        if (todoState is! NoInternetState) {
          return _drawerItems;
        } else {
          return _drawerItems.where((item) {
            return item.title != 'Log-Out' && item.title != 'Add Task';
          }).toList();
        }
      },
      [todoState],
    );

    return Drawer(
      width: context.width() * 0.5,
      child: SizedBox(
        height: context.height(),
        width: context.width(),
        child: Column(
          children: [
            const Expanded(flex: 1, child: DrawerHeaderComponent()),
            Expanded(
              flex: 5,
              child: ListView(
                reverse: true,
                children: [
                  const SizedBox(height: 64),
                  ...visibleItems.map((item) => DrawerItemComponent(title: item.title, onTap: item.onTap)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
