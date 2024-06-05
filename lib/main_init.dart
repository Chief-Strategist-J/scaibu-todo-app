import 'package:todo_app/core/todo_library.dart';

InitialSetup initialSetup = InitialSetup();

class InitialSetup {
  String path = translationPath;

  Locale fallbackLocale = Locale('en', 'US');

  List<Locale> supportedLocales = [
    Locale('en'),
  ];

  Future<void> firebaseInit() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  Future<void> languageInit() async {
    await EasyLocalization.ensureInitialized();
  }

  Future<void> utilityInit() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initialize();
  }
}
