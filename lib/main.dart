import 'package:todo_app/core/todo_library.dart';


Future<void> main() async {
  await initialSetup.utilityInit();
  await initialSetup.firebaseInit();
  await initialSetup.languageInit();

  runApp(
    EasyLocalization(
      path: initialSetup.path,
      supportedLocales: initialSetup.supportedLocales,
      fallbackLocale: initialSetup.fallbackLocale,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
