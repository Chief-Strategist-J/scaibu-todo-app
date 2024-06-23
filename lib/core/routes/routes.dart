import 'package:todo_app/core/app_library.dart';

final router = GoRouter(
  initialLocation: ApplicationPaths.splashPage,
  routes: [
    GoRoute(
      name: ApplicationPaths.splashPage,
      path: ApplicationPaths.splashPage,
      builder: (context, state) {

        return const SplashPage();
      },
    ),
    GoRoute(
      name: ApplicationPaths.loginPage,
      path: ApplicationPaths.loginPage,
      builder: (context, state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      name: ApplicationPaths.profilePage,
      path: ApplicationPaths.profilePage,
      builder: (context, state) {
        return const ProfilePage();
      },
    ),
    GoRoute(
      name: ApplicationPaths.registrationPage,
      path: ApplicationPaths.registrationPage,
      builder: (context, state) {
        return const RegistrationPage();
      },
    ),
    GoRoute(
      name: ApplicationPaths.forgetPasswordPage,
      path: ApplicationPaths.forgetPasswordPage,
      builder: (context, state) {
        return const ForgetPasswordPage();
      },
    ),
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
