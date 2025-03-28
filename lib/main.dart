import 'package:pillu_app/core/library/pillu_lib.dart'
    hide PilluAuthBloc, toast;
import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/core/network/internetConnection/internet_connection_cubit.dart';

/// used this for public cred
GetIt getIt = GetIt.instance;

/// used this for public cred
UserCredentials userCredentials = getIt<UserCredentials>(
  instanceName: ServiceInstance.userCredentialsKey,
);

/// Use for pillu configuration
final AppConfig appConfig = AppConfig();

void main() async {
  await InitialSetup.utilityInit();
  await InitialSetup.firebaseInit();
  await InitialSetup.languageInit();
  // TODO : This is used for one signal notification management
  /// await InitialSetup.oneSignalInit();
  await InitialSetup.localStorageInit();
  Provider.debugCheckInvalidValueType = null;
  textBoldSizeGlobal = 12;
  getIt = GetIt.instance;

  await Dependency.setup();
  await appConfig.configure(isConfigureFirebase: false);

  await getIt.isReady<UserCredentials>(
    instanceName: ServiceInstance.userCredentialsKey,
  );

  userCredentials = getIt<UserCredentials>(
    instanceName: ServiceInstance.userCredentialsKey,
  );

  await SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ],
  ).then((final void value) {
    runApp(
      EasyLocalization(
        path: InitialSetup.path,
        supportedLocales: InitialSetup.supportedLocales,
        fallbackLocale: InitialSetup.fallbackLocale,
        child: const MyApp(),
      ),
    );
  });

  WidgetsBinding.instance.addObserver(LifecycleObserver());
}

/// A class that observes changes in the app's lifecycle state
/// and performs actions accordingly.
/// It extends [WidgetsBindingObserver] to listen for lifecycle events.
class LifecycleObserver extends WidgetsBindingObserver {
  /// Called when the app's lifecycle state changes.
  ///
  /// The [state] parameter indicates the new state of the app.
  /// If the app is detached (i.e., removed from the screen),
  /// it disposes of the dependencies.
  @override
  Future<void> didChangeAppLifecycleState(final AppLifecycleState state) async {
    /// Checks if the app lifecycle state is detached.
    if (state == AppLifecycleState.detached) {
      /// Dispose of any dependencies or resources that are no longer needed.
      await Dependency.dispose();
    }
  }
}

/// A custom [HookWidget] that represents the main application widget.
class MyApp extends HookWidget {
  /// Creates an instance of [MyApp].
  ///
  /// The [key] parameter is passed to the superclass to manage the
  /// widget's state.
  const MyApp({super.key});

  /// A getter that returns a list of [SingleChildWidget]
  /// providers for managing BLoC instances.
  /// This is typically used to wrap the widgets that
  /// need access to certain BLoCs for state management.
  List<SingleChildWidget> get blocProviders => <SingleChildWidget>[
        BlocProvider<InternetConnectionCubit>(
          create: (final BuildContext context) => InternetConnectionCubit(),
        ),
        BlocProvider<TodoAuthBloc>(
          create: (final BuildContext context) =>
              GetIt.instance<TodoAuthBloc>()..add(AuthInitEvent()),
        ),
        BlocProvider<TodoBloc>(
          create: (final BuildContext context) => GetIt.instance<TodoBloc>(),
        ),
        BlocProvider<TagBloc>(
          create: (final BuildContext context) => GetIt.instance<TagBloc>(
            instanceName: TagsDependencyInjection.tagBloc,
          ),
        ),
        BlocProvider<PomodoroBloc>(
          create: (final BuildContext context) => GetIt.instance<PomodoroBloc>(
            instanceName: PomodoroDependencyInjection.pomodoroBloc,
          ),
        ),
        BlocProvider<ProjectBloc>(
          create: (final BuildContext context) => GetIt.instance<ProjectBloc>(
            instanceName: ProjectDependencyInjection.projectBloc,
          ),
        ),
        BlocProvider<NotificationBloc>(
          create: (final BuildContext context) =>
              GetIt.instance<NotificationBloc>(
            instanceName: NotificationDependencyInjection.notificationBloc,
          ),
        ),
      ];

  /// A getter that returns a list of [SingleChildWidget]
  /// providers for managing state.
  /// This is typically used to provide instances of various services or
  /// state management
  /// objects to the widget tree.
  List<SingleChildWidget> get providers => <SingleChildWidget>[
        /// Provides an instance of [AuthFormState] to the widget tree.
        /// [AuthFormState] will be created whenever the widget is built.
        Provider<AuthFormState>(
          create: (final BuildContext context) => AuthFormState(),
        ),
      ];

  Dispose? _checkInternetConnectivity() {
    unawaited(_listenInternetConnection());

    return () {};
  }

  Future<void> _listenInternetConnection() async {
    Connectivity().checkConnectivity().asStream().listen(
      (final List<ConnectivityResult> status) {
        if (status.any(
          (final ConnectivityResult element) =>
              element == ConnectivityResult.bluetooth ||
              element == ConnectivityResult.wifi ||
              element == ConnectivityResult.mobile ||
              element == ConnectivityResult.ethernet ||
              element == ConnectivityResult.vpn,
        )) {
          toast('your_internet_is_not_connected'.tr(), bgColor: redColor);
        }
      },
    );
  }

  @override
  Widget build(final BuildContext context) {
    useEffect(_checkInternetConnectivity, <Object?>[]);

    return MultiBlocProvider(
      providers: blocProviders,
      child: MultiProvider(
        providers: providers,
        child: MaterialApp.router(
          title: 'TODO Application',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: AppThemeData.lightTheme,
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        ),
      ),
    );
  }
}
