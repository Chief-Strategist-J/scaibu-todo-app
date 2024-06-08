import 'package:todo_app/core/todo_library.dart';
import 'package:todo_app/core/utils/log_service.dart';
import 'package:todo_app/core/utils/parse_service.dart';

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
}

final getIt = GetIt.instance;

class Dependency {
  static String get firebaseApi => 'FirebaseApi';

  static String get localApi => 'LocalApi';

  static String get firebaseRepo => 'FirebaseRepo';

  static String get serverRepo => 'ServerRepo';

  static void setup() {
    registerService();

    /// TODOs Dependency
    todoDependency();
  }

  static void todoDependency() {
    registerTodoApi();
    registerTodoRepository();
    registerTodoUseCase();
  }

  static void registerTodoApi() {
    getIt.registerSingleton<BaseApi>(FirebaseApiImpl(), instanceName: firebaseApi);
    getIt.registerSingleton<BaseApi>(LocalApiImpl(RestApiImpl()), instanceName: localApi);
  }

  static void registerTodoRepository() {
    getIt.registerSingleton<TodoRepository>(
      TodoRepositoryImpl(getIt<BaseApi>(instanceName: firebaseApi)),
      instanceName: firebaseRepo,
    );

    getIt.registerSingleton<TodoRepository>(
      TodoRepositoryImpl(getIt<BaseApi>(instanceName: localApi)),
      instanceName: serverRepo,
    );
  }

  static void registerTodoUseCase() {
    getIt.registerFactory(() {
      return GetTodoListUseCase(
        firebaseRepo: getIt<TodoRepository>(instanceName: firebaseRepo),
        databaseRepo: getIt<TodoRepository>(instanceName: serverRepo),
      );
    });

    getIt.registerFactory(() {
      return CreateTodoUseCase(
        firebaseRepo: getIt<TodoRepository>(instanceName: firebaseRepo),
        databaseRep: getIt<TodoRepository>(instanceName: serverRepo),
      );
    });
    getIt.registerFactory(() {
      return UpdateTodoUseCase(
        firebaseRepo: getIt<TodoRepository>(instanceName: firebaseRepo),
        databaseRep: getIt<TodoRepository>(instanceName: serverRepo),
      );
    });
  }

  static void registerService() {
    getIt.registerLazySingleton(() {
      log('\n\nLOG SERVICE IN INITIALIZED\n\n');
      return LogService();
    });

    getIt.registerLazySingleton(() {
      log('\n\nPARSE SERVICE IN INITIALIZED\n\n');
      return ParseService();
    });

    getIt.registerLazySingleton(() {
      log('\n\nTIME SERVICE IN INITIALIZED\n\n');
      return TimeService();
    });
  }
}
