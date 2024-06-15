import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:todo_app/core/todo_library.dart';

Future<void> main() async {
  await initialSetup.utilityInit();
  await initialSetup.firebaseInit();
  await initialSetup.languageInit();
  await initialSetup.localStorageInit();

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
            toast("Not Connected", length: Toast.LENGTH_LONG);
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'TODO Application',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppThemeData.lightTheme,
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
