import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/core/network/network_service.dart';
import 'package:todo_app/core/routes/route_service.dart';
import 'package:todo_app/feature/todo/data/dataSource/firebase_api_impl.dart';
import 'package:todo_app/feature/todo/data/dataSource/local_api_impl.dart';
import 'package:todo_app/feature/todo/data/repository/todo_repository_impl.dart';
import 'package:todo_app/feature/todo/presentation/bloc/todo_bloc.dart';
import 'package:todo_app/feature/todo/presentation/bloc/todo_event.dart';
import 'package:todo_app/feature/todo/presentation/page/create_todo_page.dart';
import 'package:todo_app/feature/todo/presentation/page/todo_page.dart';

final router = GoRouter(
  initialLocation: ApplicationPaths.todoListViewPage,
  routes: [
    GoRoute(
      name: ApplicationPaths.todoListViewPage, // Optional, add name to your routes. Allows you navigate by name instead of path
      path: ApplicationPaths.todoListViewPage,
      builder: (context, state) {
        return BlocProvider<TodoBloc>(
          create: (context) {
            return TodoBloc(
              fireTodo: TodoRepositoryImpl(FirebaseApiImpl()),
              serverTodo: TodoRepositoryImpl(LocalApiImpl(RestApiImpl())),
            )..add(
                InitEvent([]),
              );
          },
          child: const TodoPage(),
        );
      },
    ),
    GoRoute(
      name: ApplicationPaths.createTodoPage,
      path: ApplicationPaths.createTodoPage,
      builder: (context, state) {
        return BlocProvider<TodoBloc>(
          create: (context) {
            return TodoBloc(
              fireTodo: TodoRepositoryImpl(FirebaseApiImpl()),
              serverTodo: TodoRepositoryImpl(LocalApiImpl(RestApiImpl())),
            )..add(
                InitEvent([]),
              );
          },
          child: CreateTodoPage(),
        );
      },
    ),
  ],
);
