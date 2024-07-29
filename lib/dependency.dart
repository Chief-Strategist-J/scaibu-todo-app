import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/core/utils/schedule_service.dart';

final getIt = GetIt.instance;

class Dependency {
  static String get firebaseApi => 'FirebaseApi';

  static String get localApi => 'LocalApi';

  static String get firebaseRepo => 'FirebaseRepo';

  static String get serverRepo => 'ServerRepo';

  static Future<void> setup() async {
    registerService();

    /// TODOs Dependency
    todoDependency();
    authDependency();

    await getIt.allReady();
  }

  static void authDependency() {
    getIt.registerSingleton<RestApi>(RestApiImpl());

    getIt.registerSingleton<UserBaseApi>(
      UserDatabaseImpl(restApi: getIt<RestApi>()),
    );

    getIt.registerSingleton<AuthRepository>(
      AuthRepositoryImpl(baseApi: getIt<UserBaseApi>()),
    );

    getIt.registerSingleton<LoginUseCase>(
      LoginUseCase(getIt<AuthRepository>()),
    );

    getIt.registerFactory(() {
      return AuthBloc();
    });
  }

  static void todoDependency() {
    registerTodoApi();
    registerTodoRepository();
    registerTodoUseCase();
  }

  static void registerTodoApi() {
    getIt.registerSingleton<BaseApi>(FirebaseApiImpl(), instanceName: firebaseApi);
    getIt.registerSingleton<BaseApi>(DataBaseApiImpl(RestApiImpl()), instanceName: localApi);
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

    getIt.registerFactory(() {
      return TodoBloc(
        firebaseRepo: getIt<TodoRepository>(instanceName: firebaseRepo),
        serverRepo: getIt<TodoRepository>(instanceName: serverRepo),
      );
    });
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

    getIt.registerFactory(() {
      return DeleteTodoUseCase(
        firebaseRepo: getIt<TodoRepository>(instanceName: firebaseRepo),
        databaseRep: getIt<TodoRepository>(instanceName: serverRepo),
      );
    });
  }

  static void registerService() {
    getIt.registerSingletonAsync<UserCredentials>(
      signalsReady: true,
      () async {
        log('\n USER-CREDENTIALS SERVICE IN INITIALIZED\n\n');
        return UserCredentials(await Hive.openBox('_UserAuthBox_'));
      },
      dispose: (userCredentials) async {
        log('\n DISPOSING USER-CREDENTIALS SERVICE\n\n');
        await userCredentials.box.close();
      },
    );

    getIt.registerLazySingleton(() {
      log('\n\nSCHEDULE SERVICE IN INITIALIZED\n\n');
      return ScheduleService();
    });

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
