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
      name: ApplicationPaths.createTodoPage,
      path: ApplicationPaths.createTodoPage,
      builder: (context, state) {
        return BlocProvider<TodoBloc>(
          create: (context) => GetIt.instance<TodoBloc>()..add(InitEvent([])),
          child: CreateTodoPage(),
        );
      },
    ),
    GoRoute(
      name: ApplicationPaths.editTodoPage,
      path: ApplicationPaths.editTodoPage,
      builder: (context, state) {
        return BlocProvider<TodoBloc>(
          create: (context) => GetIt.instance<TodoBloc>()..add(InitEvent([])),
          child: EditTodoPage(state.extra as EditTodoPageParam),
        );
      },
    ),
  ],
);
