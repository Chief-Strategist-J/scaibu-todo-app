import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/routes/route_service.dart';
import 'package:todo_app/feature/todo/presentation/bloc/todo_bloc.dart';
import 'package:todo_app/feature/todo/presentation/bloc/todo_event.dart';
import 'package:todo_app/feature/todo/presentation/page/create_todo_page.dart';
import 'package:todo_app/feature/todo/presentation/page/edit_todo_page.dart';
import 'package:todo_app/feature/todo/presentation/page/todo_page.dart';

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
