import 'package:todo_app/core/todo_library.dart';

final router = GoRouter(
  initialLocation: ApplicationPaths.todoListViewPage,
  routes: [
    GoRoute(
      name: ApplicationPaths.todoListViewPage,
      path: ApplicationPaths.todoListViewPage,
      builder: (context, state) {
        if (!isInternetConnected) {
          context.read<TodoBloc>().add(NoInternetConnectionEvent());
        }

        return const TodoPage();
      },
    ),
    GoRoute(
      name: ApplicationPaths.manageTodoPage,
      path: ApplicationPaths.manageTodoPage,
      builder: (context, state) {
        if (!isInternetConnected) {
          context.read<TodoBloc>().add(NoInternetConnectionEvent());
        }

        return ManageTodoPage(todoPage: state.extra as ManageTodoPageParam?);
      },
    ),
  ],
);
