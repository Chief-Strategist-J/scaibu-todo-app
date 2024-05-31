import 'package:go_router/go_router.dart';
import 'package:todo_app/core/routes/route_service.dart';
import 'package:todo_app/feature/todo/presentation/page/create_todo_page.dart';
import 'package:todo_app/feature/todo/presentation/page/todo_page.dart';

final router = GoRouter(
  initialLocation: Path.todoListViewPage,
  routes: [
    GoRoute(
      name: Path.todoListViewPage, // Optional, add name to your routes. Allows you navigate by name instead of path
      path: Path.todoListViewPage,
      builder: (context, state) => TodoPage(),
    ),
    GoRoute(
      name: Path.createTodoPage,
      path: Path.createTodoPage,
      builder: (context, state) => CreateTodoPage(),
    ),
  ],
);