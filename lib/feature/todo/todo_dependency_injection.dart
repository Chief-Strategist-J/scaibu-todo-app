import 'package:todo_app/core/app_library.dart';

/// Doc Required
class TodoDependencyInjection {
  /// Doc Required
  static String get firebaseApi => 'FirebaseApi';

  /// Doc Required
  static String get localApi => 'LocalApi';

  /// Doc Required
  static String get firebaseRepo => 'FirebaseRepo';

  /// Doc Required
  static String get serverRepo => 'ServerRepo';

  /// Doc Required
  static void todoDependency() {
    registerTodoApi();
    registerTodoRepository();
    registerTodoUseCase();
  }

  /// Doc Required
  static void registerTodoApi() {
    getIt
      ..registerSingleton<BaseApi>(FirebaseApiImpl(), instanceName: firebaseApi)
      ..registerSingleton<BaseApi>(DataBaseApiImpl(restApi),
          instanceName: localApi);
  }

  /// Doc Required
  static void registerTodoRepository() {
    getIt
      ..registerSingleton<TodoRepository>(
        TodoRepositoryImpl(getIt<BaseApi>(instanceName: firebaseApi)),
        instanceName: firebaseRepo,
      )
      ..registerSingleton<TodoRepository>(
        TodoRepositoryImpl(getIt<BaseApi>(instanceName: localApi)),
        instanceName: serverRepo,
      )
      ..registerFactory(TodoBloc.new);
  }

  /// Doc Required
  static void registerTodoUseCase() {
    getIt
      ..registerFactory(() => GetTodoListUseCase(
            databaseRepo: getIt<TodoRepository>(instanceName: serverRepo),
          ))
      ..registerFactory(() => CreateTodoUseCase(
            firebaseRepo: getIt<TodoRepository>(instanceName: firebaseRepo),
            databaseRep: getIt<TodoRepository>(instanceName: serverRepo),
          ))
      ..registerFactory(() => UpdateTodoUseCase(
            databaseRep: getIt<TodoRepository>(instanceName: serverRepo),
          ))
      ..registerFactory(() => DeleteTodoUseCase(
            databaseRep: getIt<TodoRepository>(instanceName: serverRepo),
          ));
  }

  /// Doc Required
  static Future<void> disposeDependencyInjection() async {
    // Unregister BaseApi implementations
    getIt
      ..unregister<BaseApi>(instanceName: firebaseApi)
      ..unregister<BaseApi>(instanceName: localApi)

      // Unregister TodoRepository implementations
      ..unregister<TodoRepository>(instanceName: firebaseRepo)
      ..unregister<TodoRepository>(instanceName: serverRepo)

      // Unregister the TodoBloc if applicable
      ..unregister<TodoBloc>()

      // Unregister use cases
      ..unregister<GetTodoListUseCase>()
      ..unregister<CreateTodoUseCase>()
      ..unregister<UpdateTodoUseCase>()
      ..unregister<DeleteTodoUseCase>();
  }
}
