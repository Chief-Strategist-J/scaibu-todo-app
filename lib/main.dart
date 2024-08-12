import 'package:todo_app/core/app_library.dart';

Future<void> main() async {
  await initialSetup.utilityInit();
  await initialSetup.firebaseInit();
  await initialSetup.languageInit();
  await initialSetup.oneSignalInit();
  await initialSetup.localStorageInit();
  Provider.debugCheckInvalidValueType = null;
  textBoldSizeGlobal = 12;

  Dependency.setup();

  runApp(
    EasyLocalization(
      path: initialSetup.path,
      supportedLocales: initialSetup.supportedLocales,
      fallbackLocale: initialSetup.fallbackLocale,
      child: const MyApp(),
    ),
  );

  WidgetsBinding.instance.addObserver(LifecycleObserver());
}

class LifecycleObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) Dependency.dispose();
  }
}

class MyApp extends HookWidget {
  const MyApp({super.key});

  List<SingleChildWidget> get blocProviders {
    return [
      BlocProvider(create: (context) => GetIt.instance<AuthBloc>()..add(AuthInitEvent())),
      BlocProvider(create: (context) => GetIt.instance<TodoBloc>()),
      BlocProvider(create: (context) => GetIt.instance<TagBloc>()),
    ];
  }

  List<SingleChildWidget> get providers {
    return [
      Provider(create: (context) => AuthFormState()),
    ];
  }

  Dispose? _checkInternetConnectivity() {
    final StreamSubscription<InternetStatus> listener = InternetConnection().onStatusChange.listen((InternetStatus status) {
      isInternetConnected = status == InternetStatus.connected;

      if (!isInternetConnected) {
        toast('your_internet_is_not_connected'.tr(), bgColor: redColor);
      }
    });

    return () => listener.cancel();
  }

  @override
  Widget build(BuildContext context) {
    useEffect(_checkInternetConnectivity, []);

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
