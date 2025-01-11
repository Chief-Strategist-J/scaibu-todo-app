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
    getIt..registerSingleton<BaseApi>(FirebaseApiImpl(),
        instanceName: firebaseApi)
    ..registerSingleton<BaseApi>(DataBaseApiImpl(restApi),
        instanceName: localApi);
  }

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

  static void registerTodoUseCase() {
    getIt
      ..registerFactory(() => GetTodoListUseCase(
            firebaseRepo: getIt<TodoRepository>(instanceName: firebaseRepo),
            databaseRepo: getIt<TodoRepository>(instanceName: serverRepo),
          ))
      ..registerFactory(() => CreateTodoUseCase(
            firebaseRepo: getIt<TodoRepository>(instanceName: firebaseRepo),
            databaseRep: getIt<TodoRepository>(instanceName: serverRepo),
          ))
      ..registerFactory(() => UpdateTodoUseCase(
            firebaseRepo: getIt<TodoRepository>(instanceName: firebaseRepo),
            databaseRep: getIt<TodoRepository>(instanceName: serverRepo),
          ))
      ..registerFactory(() => DeleteTodoUseCase(
            firebaseRepo: getIt<TodoRepository>(instanceName: firebaseRepo),
            databaseRep: getIt<TodoRepository>(instanceName: serverRepo),
          ));
  }

  static Future<void> disposeDependencyInjection() async {
    // Unregister BaseApi implementations
    getIt..unregister<BaseApi>(instanceName: firebaseApi)
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
