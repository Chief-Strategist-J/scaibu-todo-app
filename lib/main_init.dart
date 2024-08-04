import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:todo_app/core/app_library.dart';

InitialSetup initialSetup = InitialSetup();

class InitialSetup {
  final String path = translationPath;

  final Locale fallbackLocale = const Locale('en', 'US');

  final List<Locale> supportedLocales = [
    const Locale('en'),
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

    /// FIREBASE ANALYTICS
    FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    analytics.logAppOpen();
  }

  Future<void> languageInit() async {
    await EasyLocalization.ensureInitialized();
  }

  Future<void> utilityInit() async {
    WidgetsFlutterBinding.ensureInitialized();
  }

  Future<void> localStorageInit() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
  }

  Future<void> oneSignalInit() async {
    OneSignal.Debug.setAlertLevel(OSLogLevel.none);
    OneSignal.initialize(Env.oneSignalAppID);
    OneSignal.consentRequired(true);
    OneSignal.consentGiven(true);

    OneSignal.Notifications.requestPermission(true);
    OneSignal.Notifications.clearAll();
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  }
}
