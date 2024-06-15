import 'package:todo_app/core/todo_library.dart';

final router = GoRouter(
  initialLocation: ApplicationPaths.todoListViewPage,
  routes: [
    GoRoute(
      name: ApplicationPaths.todoListViewPage,
      path: ApplicationPaths.todoListViewPage,
      builder: (context, state) {
        return BlocProvider<TodoBloc>(
          create: (context) => GetIt.instance<TodoBloc>()..add(InitEvent([])),
          child: const TodoPage(),
        );
      },
    ),
    GoRoute(
      name: ApplicationPaths.manageTodoPage,
      path: ApplicationPaths.manageTodoPage,
      builder: (context, state) {
        return BlocProvider<TodoBloc>(
          create: (context) => GetIt.instance<TodoBloc>()..add(InitEvent([])),
          child: ManageTodoPage(todoPage: state.extra as ManageTodoPageParam?),
        );
      },
    ),
  ],
);
