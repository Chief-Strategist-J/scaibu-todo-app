import 'package:todo_app/core/app_library.dart';

/// A class that handles the initial setup for localization in the app.
/// It defines the default translation path, fallback locale, and supported
/// locales.
class InitialSetup {
  /// The path to the translation files, which is used for loading translations.
  /// This path can be customized as needed.
  static const String path = translationPath;

  /// The fallback locale used when the user's preferred locale is not
  /// supported.
  /// In this case, it defaults to US English ('en', 'US').
  static const Locale fallbackLocale = Locale('en', 'US');

  /// A list of supported locales by the app.
  /// This is used to determine which languages are available for localization.
  static final List<Locale> supportedLocales = <Locale>[
    const Locale('en'), // Only English is supported in this setup.
  ];

  /// Initializes Firebase for the app.
  /// This method should be called at the beginning of the app lifecycle to
  /// ensure that Firebase is set up correctly.
  static Future<void> firebaseInit() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    /// CRASH-ANALYTICS
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    PlatformDispatcher.instance.onError = (
      final Object error,
      final StackTrace stack,
    ) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };

    /// FIREBASE ANALYTICS
    final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    await analytics.logAppOpen();
  }

  /// Initializes the language support by ensuring that EasyLocalization
  /// is properly set up.
  /// This should be called early in the app lifecycle to ensure that
  /// localization is available.
  static Future<void> languageInit() async {
    await EasyLocalization.ensureInitialized();
  }

  /// Initializes utilities required by the app, such as setting
  /// up the Flutter bindings.
  /// This should be called before using any Flutter-specific services
  /// like widgets.
  static Future<void> utilityInit() async {
    WidgetsFlutterBinding.ensureInitialized();
  }

  /// Initializes the local storage by setting up Hive.
  /// This method ensures that Hive is properly initialized and ready to
  /// use for local storage.
  static Future<void> localStorageInit() async {
    /// Retrieves the application documents directory.
    final Directory directory = await getApplicationDocumentsDirectory();
    /// Initializes Hive with the path of the application documents directory.
    Hive.init(directory.path);
  }

  /// Initializes OneSignal for push notifications in the app.
  /// This method should be called early in the app
  /// lifecycle to set up OneSignal for sending and receiving push
  /// notifications.
  static Future<void> oneSignalInit() async {
    await OneSignal.Debug.setAlertLevel(OSLogLevel.none);
    OneSignal.initialize(Env.oneSignalAppID);
    await OneSignal.consentRequired(true);
    await OneSignal.consentGiven(true);

    await OneSignal.Notifications.requestPermission(true);
    await OneSignal.Notifications.clearAll();
    await OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  }
}
