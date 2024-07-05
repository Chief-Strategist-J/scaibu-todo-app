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
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription<InternetStatus>? listener;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    listener = InternetConnection().onStatusChange.listen(
      (InternetStatus status) {
        switch (status) {
          case InternetStatus.connected:
            isInternetConnected = true;
            break;
          case InternetStatus.disconnected:
            isInternetConnected = false;
            toast(
              'your_internet_is_not_connected'.tr(),
              length: Toast.LENGTH_LONG,
              bgColor: redColor,
            );

            break;
        }
      },
    );
  }

  @override
  void dispose() {
    listener?.cancel();
    super.dispose();
  }

  List<SingleChildWidget> get blocProviders {
    return [
      BlocProvider(create: (context) => GetIt.instance<TodoBloc>()..add(InitEvent(const []))),
      BlocProvider(create: (context) => GetIt.instance<AuthBloc>()..add(AuthInitEvent())),
    ];
  }

  List<SingleChildWidget> providers = [
    Provider(create: (context) => AuthFormState()),
  ];

  @override
  Widget build(BuildContext context) {
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
