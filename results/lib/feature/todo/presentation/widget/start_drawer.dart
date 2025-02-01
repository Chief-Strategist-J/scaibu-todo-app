import 'package:todo_app/core/app_library.dart';

/// Doc Required
class DrawerComponent extends HookWidget {
  /// Doc Required
  const DrawerComponent({super.key});

  @override
  Widget build(final BuildContext context) {
    final TodoBloc todoBloc = BlocProvider.of<TodoBloc>(context);
    final AsyncSnapshot<TodoState> todoState =
        useStream(todoBloc.stream, initialData: todoBloc.state);

    final List<DrawerItemModel> drawerItems =
        useMemoized(() => DrawerItemModel.itemList(context));

    final List<DrawerItemModel> visibleItems = useMemoized(
      () {
        if (todoState is! NoInternetState) {
          return drawerItems;
        } else {
          return drawerItems
              .where((final DrawerItemModel item) =>
                  item.title != 'Log-Out' && item.title != 'Add Task')
              .toList();
        }
      },
      <Object?>[todoState],
    );

    return Drawer(
      width: context.width() * 0.5,
      child: SizedBox(
        height: context.height(),
        width: context.width(),
        child: Column(
          children: <Widget>[
            const Expanded(child: DrawerHeaderComponent()),
            Expanded(
              flex: 5,
              child: ListView(
                reverse: true,
                children: <Widget>[
                  const SizedBox(height: 64),
                  ...visibleItems.map((final DrawerItemModel item) =>
                      DrawerItemComponent(
                          title: item.title, onTap: item.onTap)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
