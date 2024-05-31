import 'package:todo_app/core/todo_library.dart';

Future<void> main() async {
  await initialSetup.utilityInit();
  await initialSetup.firebaseInit();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'TODO Application',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
