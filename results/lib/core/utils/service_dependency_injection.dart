import 'package:todo_app/core/app_library.dart';

/// A class for registering services in the dependency injection container.
class ServiceDependencyInjection {
  /// Registers the services needed in the application.
  static Future<void> registerService() async {
    getIt.registerLazySingletonAsync<UserCredentials>(
      () async {
        log('\n USER-CREDENTIALS SERVICE IS INITIALIZED\n\n');
        return UserCredentials(await Hive.openBox('_UserAuthBox_'));
      },
      instanceName: ServiceInstance.userCredentialsKey,
      dispose: (final UserCredentials userCredentials) async {
        log('\n DISPOSING USER-CREDENTIALS SERVICE\n\n');
        await userCredentials.box.close();
      },
    );

    await getIt.isReady<UserCredentials>(
        instanceName: ServiceInstance.userCredentialsKey);
    userCredentials = getIt<UserCredentials>(
        instanceName: ServiceInstance.userCredentialsKey);

    getIt
      ..registerLazySingleton(() {
        log('\n\nSCHEDULE SERVICE IN INITIALIZED\n\n');
        return ScheduleService();
      })
      ..registerLazySingleton(() {
        log('\n\nLOG SERVICE IN INITIALIZED\n\n');
        return LogService();
      })
      ..registerLazySingleton(() {
        log('\n\nPARSE SERVICE IN INITIALIZED\n\n');
        return ParseService();
      })
      ..registerLazySingleton(() {
        log('\n\n UTILITY SERVICE IN INITIALIZED\n\n');
        return UtilityService();
      })
      ..registerLazySingleton(() {
        log('\n\nTIME SERVICE IN INITIALIZED\n\n');
        return TimeService();
      });
  }

  /// Disposes the services when no longer needed.
  static Future<void> disposeService() async {
    log('\n SERVICE IN DISPOSED\n\n');
    getIt
      ..unregister<UserCredentials>(
          instanceName: ServiceInstance.userCredentialsKey)
      ..unregister<ScheduleService>()
      ..unregister<LogService>()
      ..unregister<ParseService>()
      ..unregister<TimeService>()
      ..unregister<UtilityService>();
  }
}
