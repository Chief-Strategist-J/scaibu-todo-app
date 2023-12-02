import 'package:firebase_core/firebase_core.dart';
import 'package:todo_app/firebase_options.dart';
import 'package:todo_app/utils/library.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoController>(create: (context) => TodoController()),
      ],
      child: Consumer<TodoController>(
        builder: (context, provider, child) {
          return MaterialApp(
            title: 'TODO Application',
            theme: provider.isLightTheme ? TodoThemeData.lightThemeData : TodoThemeData.dartThemeData,
            debugShowCheckedModeBanner: false,
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
