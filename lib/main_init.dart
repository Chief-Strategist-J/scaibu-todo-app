import 'package:path_provider/path_provider.dart';
import 'package:todo_app/core/app_library.dart';

InitialSetup initialSetup = InitialSetup();

class InitialSetup {
  final String path = translationPath;

  final Locale fallbackLocale = Locale('en', 'US');

  final List<Locale> supportedLocales = [
    Locale('en'),
  ];

  Future<void> firebaseInit() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    /// CRASH-ANALYTICS
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  Future<void> languageInit() async {
    await EasyLocalization.ensureInitialized();
  }

  Future<void> utilityInit() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initialize();
  }

  Future<void> localStorageInit() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
  }
}
