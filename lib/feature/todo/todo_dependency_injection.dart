import 'package:todo_app/core/app_library.dart';

class TodoDependencyInjection {
  static String get firebaseApi => 'FirebaseApi';

  static String get localApi => 'LocalApi';

  static String get firebaseRepo => 'FirebaseRepo';

  static String get serverRepo => 'ServerRepo';

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

  static void disposeDependencyInjection() {
    // Unregister BaseApi implementations
    getIt.unregister<BaseApi>(instanceName: firebaseApi);
    getIt.unregister<BaseApi>(instanceName: localApi);

    // Unregister TodoRepository implementations
    getIt.unregister<TodoRepository>(instanceName: firebaseRepo);
    getIt.unregister<TodoRepository>(instanceName: serverRepo);

    // Unregister the TodoBloc if applicable
    getIt.unregister<TodoBloc>();

    // Unregister use cases
    getIt.unregister<GetTodoListUseCase>();
    getIt.unregister<CreateTodoUseCase>();
    getIt.unregister<UpdateTodoUseCase>();
    getIt.unregister<DeleteTodoUseCase>();
  }
}
