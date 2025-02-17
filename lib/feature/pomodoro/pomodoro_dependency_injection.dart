import 'package:todo_app/core/app_library.dart';

/// Doc Required
class PomodoroDependencyInjection {
  /// Doc Required
  static const String createPomodoroUseCase = 'create_pomodoro_use_case';

  /// Doc Required
  static const String endPomodoroUseCase = 'end_pomodoro_use_case';

  /// Doc Required
  static const String getPomodoroStatsUseCase = 'get_pomodoro_stats_use_case';

  /// Doc Required
  static const String resumePomodoroUseCase = 'resume_pomodoro_use_case';

  /// Doc Required
  static const String startPomodoroUseCase = 'start_pomodoro_use_case';

  /// Doc Required
  static const String stopPomodoroUseCase = 'stop_pomodoro_use_case';

  /// Doc Required
  static const String pomodoroRemoteDatabase = 'pomodoro_remote_database';

  /// Doc Required
  static const String pomodoroRemoteFirebase = 'pomodoro_remote_firebase';

  /// Doc Required
  static const String pomodoroRemoteDatabaseImplementation =
      'pomodoro_remote_database_implementation';

  /// Doc Required
  static const String pomodoroRemoteFirebaseImplementation =
      'pomodoro_remote_firebase_implementation';

  /// Doc Required
  static const String pomodoroRepositoryImpl = 'pomodoro_repository_impl';

  /// Doc Required
  static const String pomodoroBloc = 'pomodoro_bloc';

  /// Doc Required
  static void setupDependencyInjection() {
    // Register APIs
    getIt
      ..registerSingleton<PomodoroBase<PomodoroEntity>>(
        instanceName: PomodoroDependencyInjection.pomodoroRemoteDatabase,
        PomodoroDatabaseApi(restApi: getIt<RestApi>()),
      )
      ..registerSingleton<PomodoroBase<PomodoroEntity>>(
        instanceName: PomodoroDependencyInjection.pomodoroRemoteFirebase,
        PomodoroFirebaseApi(),
      )

      // Register Repositories
      ..registerSingleton<PomodoroRepository<PomodoroEntity>>(
        instanceName:
            PomodoroDependencyInjection.pomodoroRemoteDatabaseImplementation,
        PomodoroRepositoryImpl(
          firebaseApi: getIt<PomodoroBase<PomodoroEntity>>(
            instanceName: PomodoroDependencyInjection.pomodoroRemoteFirebase,
          ),
          databaseApi: getIt<PomodoroBase<PomodoroEntity>>(
            instanceName: PomodoroDependencyInjection.pomodoroRemoteDatabase,
          ),
        ),
      )
      ..registerSingleton<PomodoroRepository<PomodoroEntity>>(
        instanceName:
            PomodoroDependencyInjection.pomodoroRemoteFirebaseImplementation,
        PomodoroRepositoryImpl(
          firebaseApi: getIt<PomodoroBase<PomodoroEntity>>(
            instanceName: PomodoroDependencyInjection.pomodoroRemoteFirebase,
          ),
          databaseApi: getIt<PomodoroBase<PomodoroEntity>>(
            instanceName: PomodoroDependencyInjection.pomodoroRemoteDatabase,
          ),
        ),
      )

      // Register Use Cases
      ..registerSingleton<CreatePomodoroUseCase>(
        instanceName: PomodoroDependencyInjection.createPomodoroUseCase,
        CreatePomodoroUseCase(
          pomodoroDatabaseRepository: getIt<PomodoroRepository<PomodoroEntity>>(
            instanceName: PomodoroDependencyInjection
                .pomodoroRemoteDatabaseImplementation,
          ),
          pomodoroFirebaseRepository: getIt<PomodoroRepository<PomodoroEntity>>(
            instanceName: PomodoroDependencyInjection
                .pomodoroRemoteFirebaseImplementation,
          ),
        ),
      )
      ..registerSingleton<EndPomodoroUseCase>(
        instanceName: PomodoroDependencyInjection.endPomodoroUseCase,
        EndPomodoroUseCase(
          pomodoroDatabaseRepository: getIt<PomodoroRepository<PomodoroEntity>>(
            instanceName: PomodoroDependencyInjection
                .pomodoroRemoteDatabaseImplementation,
          ),
          pomodoroFirebaseRepository: getIt<PomodoroRepository<PomodoroEntity>>(
            instanceName: PomodoroDependencyInjection
                .pomodoroRemoteFirebaseImplementation,
          ),
        ),
      )
      ..registerSingleton<GetPomodoroStatsUseCase<dynamic>>(
        instanceName: PomodoroDependencyInjection.getPomodoroStatsUseCase,
        GetPomodoroStatsUseCase<dynamic>(
          pomodoroDatabaseRepository: getIt<PomodoroRepository<PomodoroEntity>>(
            instanceName: PomodoroDependencyInjection
                .pomodoroRemoteDatabaseImplementation,
          ),
          pomodoroFirebaseRepository: getIt<PomodoroRepository<PomodoroEntity>>(
            instanceName: PomodoroDependencyInjection
                .pomodoroRemoteFirebaseImplementation,
          ),
        ),
      )
      ..registerSingleton<ResumePomodoroUseCase>(
        instanceName: PomodoroDependencyInjection.resumePomodoroUseCase,
        ResumePomodoroUseCase(
          pomodoroDatabaseRepository: getIt<PomodoroRepository<PomodoroEntity>>(
            instanceName: PomodoroDependencyInjection
                .pomodoroRemoteDatabaseImplementation,
          ),
          pomodoroFirebaseRepository: getIt<PomodoroRepository<PomodoroEntity>>(
            instanceName: PomodoroDependencyInjection
                .pomodoroRemoteFirebaseImplementation,
          ),
        ),
      )
      ..registerSingleton<StartPomodoroUseCase>(
        instanceName: PomodoroDependencyInjection.startPomodoroUseCase,
        StartPomodoroUseCase(
          pomodoroDatabaseRepository: getIt<PomodoroRepository<PomodoroEntity>>(
            instanceName: PomodoroDependencyInjection
                .pomodoroRemoteDatabaseImplementation,
          ),
          pomodoroFirebaseRepository: getIt<PomodoroRepository<PomodoroEntity>>(
            instanceName: PomodoroDependencyInjection
                .pomodoroRemoteFirebaseImplementation,
          ),
        ),
      )
      ..registerSingleton<StopPomodoroUseCase>(
        instanceName: PomodoroDependencyInjection.stopPomodoroUseCase,
        StopPomodoroUseCase(
          pomodoroDatabaseRepository: getIt<PomodoroRepository<PomodoroEntity>>(
            instanceName: PomodoroDependencyInjection
                .pomodoroRemoteDatabaseImplementation,
          ),
          pomodoroFirebaseRepository: getIt<PomodoroRepository<PomodoroEntity>>(
            instanceName: PomodoroDependencyInjection
                .pomodoroRemoteFirebaseImplementation,
          ),
        ),
      )

      // Register Bloc
      ..registerFactory<PomodoroBloc>(
        instanceName: PomodoroDependencyInjection.pomodoroBloc,
        PomodoroBloc.new,
      );
  }

  /// Doc Required
  static Future<void> disposeDependencyInjection() async {
    // Unregister APIs
    getIt
      ..unregister<PomodoroBase<PomodoroModel>>(
        instanceName: PomodoroDependencyInjection.pomodoroRemoteDatabase,
      )
      ..unregister<PomodoroBase<PomodoroModel>>(
        instanceName: PomodoroDependencyInjection.pomodoroRemoteFirebase,
      )

      // Unregister Repositories
      ..unregister<PomodoroRepository<PomodoroModel>>(
        instanceName:
            PomodoroDependencyInjection.pomodoroRemoteDatabaseImplementation,
      )
      ..unregister<PomodoroRepository<PomodoroModel>>(
        instanceName:
            PomodoroDependencyInjection.pomodoroRemoteFirebaseImplementation,
      )

      // Unregister Use Cases
      ..unregister<CreatePomodoroUseCase>(
        instanceName: PomodoroDependencyInjection.createPomodoroUseCase,
      )
      ..unregister<EndPomodoroUseCase>(
        instanceName: PomodoroDependencyInjection.endPomodoroUseCase,
      )
      ..unregister<GetPomodoroStatsUseCase<dynamic>>(
        instanceName: PomodoroDependencyInjection.getPomodoroStatsUseCase,
      )
      ..unregister<ResumePomodoroUseCase>(
        instanceName: PomodoroDependencyInjection.resumePomodoroUseCase,
      )
      ..unregister<StartPomodoroUseCase>(
        instanceName: PomodoroDependencyInjection.startPomodoroUseCase,
      )
      ..unregister<StopPomodoroUseCase>(
        instanceName: PomodoroDependencyInjection.stopPomodoroUseCase,
      )

      // Unregister Bloc
      ..unregister<PomodoroBloc>(
        instanceName: PomodoroDependencyInjection.pomodoroBloc,
      );
  }
}
