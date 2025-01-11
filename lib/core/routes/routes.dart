import 'package:todo_app/core/app_library.dart';

final GoRouter router = GoRouter(
  initialLocation: ApplicationPaths.splashPage,
  observers: <NavigatorObserver>[
    FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
  ],
  redirect: (final BuildContext context, final GoRouterState state) {
    FirebaseAnalytics.instance.logEvent(
      name: 'page_view',
      parameters: <String, Object>{
        'page_name': state.name ?? 'unknown',
        'page_path': state.name ?? 'unknown',
      },
    );
    return null; // Return null to continue with the navigation
  },
  routes: <RouteBase>[
    GoRoute(
      name: ApplicationPaths.splashPage,
      path: ApplicationPaths.splashPage,
      builder: (final BuildContext context, final GoRouterState state) =>
          const SplashPage(),
    ),
    GoRoute(
      name: ApplicationPaths.loginPage,
      path: ApplicationPaths.loginPage,
      builder: (final BuildContext context, final GoRouterState state) =>
          const LoginPage(),
    ),
    GoRoute(
      name: ApplicationPaths.profilePage,
      path: ApplicationPaths.profilePage,
      builder: (final BuildContext context, final GoRouterState state) =>
          const ProfilePage(),
    ),
    GoRoute(
      name: ApplicationPaths.registrationPage,
      path: ApplicationPaths.registrationPage,
      builder: (final BuildContext context, final GoRouterState state) =>
          const RegistrationPage(),
    ),
    GoRoute(
      name: ApplicationPaths.forgetPasswordPage,
      path: ApplicationPaths.forgetPasswordPage,
      builder: (final BuildContext context, final GoRouterState state) =>
          const ForgetPasswordPage(),
    ),
    GoRoute(
      name: ApplicationPaths.todoListViewPage,
      path: ApplicationPaths.todoListViewPage,
      builder: (final BuildContext context, final GoRouterState state) =>
          const TodoPage(),
    ),
    GoRoute(
      name: ApplicationPaths.manageTodoPage,
      path: ApplicationPaths.manageTodoPage,
      builder: (final BuildContext context, final GoRouterState state) =>
          ManageTodoPage(todoPage: state.extra as ManageTodoPageParam?),
    ),
    GoRoute(
      name: ApplicationPaths.createTagPage,
      path: ApplicationPaths.createTagPage,
      builder: (final BuildContext context, final GoRouterState state) =>
          CreateTagPage(),
    ),
    GoRoute(
      name: ApplicationPaths.pomodoroPage,
      path: ApplicationPaths.pomodoroPage,
      builder: (final BuildContext context, final GoRouterState state) =>
          const PomodoroPage(),
    ),
    GoRoute(
      name: ApplicationPaths.notificationPage,
      path: ApplicationPaths.notificationPage,
      builder: (final BuildContext context, final GoRouterState state) =>
          const NotificationPage(),
    ),
    GoRoute(
      name: ApplicationPaths.settingPage,
      path: ApplicationPaths.settingPage,
      builder: (final BuildContext context, final GoRouterState state) =>
          const SettingPage(),
    ),
    GoRoute(
      name: ApplicationPaths.createProjectPage,
      path: ApplicationPaths.createProjectPage,
      builder: (final BuildContext context, final GoRouterState state) =>
          const ProjectPage(),
    ),
    GoRoute(
      name: ApplicationPaths.listOfProjectScreen,
      path: ApplicationPaths.listOfProjectScreen,
      builder: (final BuildContext context, final GoRouterState state) =>
          const ProjectListScreen(),
    ),
  ],
);
