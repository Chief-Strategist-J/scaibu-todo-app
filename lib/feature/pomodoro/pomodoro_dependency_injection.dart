import 'package:todo_app/core/app_library.dart';

class PomodoroDependencyInjection {
  static const createPomodoroUseCase = 'create_pomodoro_use_case';
  static const endPomodoroUseCase = 'end_pomodoro_use_case';
  static const getPomodoroStatsUseCase = 'get_pomodoro_stats_use_case';
  static const resumePomodoroUseCase = 'resume_pomodoro_use_case';
  static const startPomodoroUseCase = 'start_pomodoro_use_case';
  static const stopPomodoroUseCase = 'stop_pomodoro_use_case';

  static const pomodoroRemoteDatabase = 'pomodoro_remote_database';
  static const pomodoroRemoteFirebase = 'pomodoro_remote_firebase';
  static const pomodoroRemoteDatabaseImplementation = 'pomodoro_remote_database_implementation';
  static const pomodoroRemoteFirebaseImplementation = 'pomodoro_remote_firebase_implementation';
  static const pomodoroRepositoryImpl = 'pomodoro_repository_impl';

  static const pomodoroBloc = 'pomodoro_bloc';

  static void setupDependencyInjection() {
    // Register APIs
    getIt.registerSingleton<PomodoroBase<PomodoroEntity>>(
      instanceName: PomodoroDependencyInjection.pomodoroRemoteDatabase,
      PomodoroDatabaseApi(restApi: getIt<RestApi>()),
    );

    getIt.registerSingleton<PomodoroBase<PomodoroEntity>>(
      instanceName: PomodoroDependencyInjection.pomodoroRemoteFirebase,
      PomodoroFirebaseApi(),
    );

    // Register Repositories
    getIt.registerSingleton<PomodoroRepository<PomodoroEntity>>(
      instanceName: PomodoroDependencyInjection.pomodoroRemoteDatabaseImplementation,
      PomodoroRepositoryImpl(
        firebaseApi: getIt<PomodoroBase<PomodoroEntity>>(
          instanceName: PomodoroDependencyInjection.pomodoroRemoteFirebase,
        ),
        databaseApi: getIt<PomodoroBase<PomodoroEntity>>(
          instanceName: PomodoroDependencyInjection.pomodoroRemoteDatabase,
        ),
      ),
    );

    getIt.registerSingleton<PomodoroRepository<PomodoroEntity>>(
      instanceName: PomodoroDependencyInjection.pomodoroRemoteFirebaseImplementation,
      PomodoroRepositoryImpl(
        firebaseApi: getIt<PomodoroBase<PomodoroEntity>>(
          instanceName: PomodoroDependencyInjection.pomodoroRemoteFirebase,
        ),
        databaseApi: getIt<PomodoroBase<PomodoroEntity>>(
          instanceName: PomodoroDependencyInjection.pomodoroRemoteDatabase,
        ),
      ),
    );

    // Register Use Cases
    getIt.registerSingleton<CreatePomodoroUseCase>(
      instanceName: PomodoroDependencyInjection.createPomodoroUseCase,
      CreatePomodoroUseCase(
        pomodoroDatabaseRepository: getIt<PomodoroRepository<PomodoroEntity>>(
          instanceName: PomodoroDependencyInjection.pomodoroRemoteDatabaseImplementation,
        ),
        pomodoroFirebaseRepository: getIt<PomodoroRepository<PomodoroEntity>>(
          instanceName: PomodoroDependencyInjection.pomodoroRemoteFirebaseImplementation,
        ),
      ),
    );

    getIt.registerSingleton<EndPomodoroUseCase>(
      instanceName: PomodoroDependencyInjection.endPomodoroUseCase,
      EndPomodoroUseCase(
        pomodoroDatabaseRepository: getIt<PomodoroRepository<PomodoroEntity>>(
          instanceName: PomodoroDependencyInjection.pomodoroRemoteDatabaseImplementation,
        ),
        pomodoroFirebaseRepository: getIt<PomodoroRepository<PomodoroEntity>>(
          instanceName: PomodoroDependencyInjection.pomodoroRemoteFirebaseImplementation,
        ),
      ),
    );

    getIt.registerSingleton<GetPomodoroStatsUseCase>(
      instanceName: PomodoroDependencyInjection.getPomodoroStatsUseCase,
      GetPomodoroStatsUseCase(
        pomodoroDatabaseRepository: getIt<PomodoroRepository<PomodoroEntity>>(
          instanceName: PomodoroDependencyInjection.pomodoroRemoteDatabaseImplementation,
        ),
        pomodoroFirebaseRepository: getIt<PomodoroRepository<PomodoroEntity>>(
          instanceName: PomodoroDependencyInjection.pomodoroRemoteFirebaseImplementation,
        ),
      ),
    );

    getIt.registerSingleton<ResumePomodoroUseCase>(
      instanceName: PomodoroDependencyInjection.resumePomodoroUseCase,
      ResumePomodoroUseCase(
        pomodoroDatabaseRepository: getIt<PomodoroRepository<PomodoroEntity>>(
          instanceName: PomodoroDependencyInjection.pomodoroRemoteDatabaseImplementation,
        ),
        pomodoroFirebaseRepository: getIt<PomodoroRepository<PomodoroEntity>>(
          instanceName: PomodoroDependencyInjection.pomodoroRemoteFirebaseImplementation,
        ),
      ),
    );

    getIt.registerSingleton<StartPomodoroUseCase>(
      instanceName: PomodoroDependencyInjection.startPomodoroUseCase,
      StartPomodoroUseCase(
        pomodoroDatabaseRepository: getIt<PomodoroRepository<PomodoroEntity>>(
          instanceName: PomodoroDependencyInjection.pomodoroRemoteDatabaseImplementation,
        ),
        pomodoroFirebaseRepository: getIt<PomodoroRepository<PomodoroEntity>>(
          instanceName: PomodoroDependencyInjection.pomodoroRemoteFirebaseImplementation,
        ),
      ),
    );

    getIt.registerSingleton<StopPomodoroUseCase>(
      instanceName: PomodoroDependencyInjection.stopPomodoroUseCase,
      StopPomodoroUseCase(
        pomodoroDatabaseRepository: getIt<PomodoroRepository<PomodoroEntity>>(
          instanceName: PomodoroDependencyInjection.pomodoroRemoteDatabaseImplementation,
        ),
        pomodoroFirebaseRepository: getIt<PomodoroRepository<PomodoroEntity>>(
          instanceName: PomodoroDependencyInjection.pomodoroRemoteFirebaseImplementation,
        ),
      ),
    );

    // Register Bloc
    getIt.registerFactory<PomodoroBloc>(
      instanceName: PomodoroDependencyInjection.pomodoroBloc,
      () => PomodoroBloc(),
    );
  }

  static void disposeDependencyInjection() {
    // Unregister APIs
    getIt.unregister<PomodoroBase<PomodoroModel>>(instanceName: PomodoroDependencyInjection.pomodoroRemoteDatabase);
    getIt.unregister<PomodoroBase<PomodoroModel>>(instanceName: PomodoroDependencyInjection.pomodoroRemoteFirebase);

    // Unregister Repositories
    getIt.unregister<PomodoroRepository<PomodoroModel>>(instanceName: PomodoroDependencyInjection.pomodoroRemoteDatabaseImplementation);
    getIt.unregister<PomodoroRepository<PomodoroModel>>(instanceName: PomodoroDependencyInjection.pomodoroRemoteFirebaseImplementation);

    // Unregister Use Cases
    getIt.unregister<CreatePomodoroUseCase>(instanceName: PomodoroDependencyInjection.createPomodoroUseCase);
    getIt.unregister<EndPomodoroUseCase>(instanceName: PomodoroDependencyInjection.endPomodoroUseCase);
    getIt.unregister<GetPomodoroStatsUseCase>(instanceName: PomodoroDependencyInjection.getPomodoroStatsUseCase);
    getIt.unregister<ResumePomodoroUseCase>(instanceName: PomodoroDependencyInjection.resumePomodoroUseCase);
    getIt.unregister<StartPomodoroUseCase>(instanceName: PomodoroDependencyInjection.startPomodoroUseCase);
    getIt.unregister<StopPomodoroUseCase>(instanceName: PomodoroDependencyInjection.stopPomodoroUseCase);

    // Unregister Bloc
    getIt.unregister<PomodoroBloc>(instanceName: PomodoroDependencyInjection.pomodoroBloc);
  }
}
