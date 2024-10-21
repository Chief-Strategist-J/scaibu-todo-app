import 'package:todo_app/core/app_library.dart';

class ServiceDependencyInjection {
  static Future<void> registerService() async {
    getIt.registerLazySingletonAsync<UserCredentials>(
      () async {
        log('\n USER-CREDENTIALS SERVICE IS INITIALIZED\n\n');
        return UserCredentials(await Hive.openBox('_UserAuthBox_'));
      },
      instanceName: ServiceInstance.userCredentialsKey,
      dispose: (userCredentials) async {
        log('\n DISPOSING USER-CREDENTIALS SERVICE\n\n');
        await userCredentials.box.close();
      },
    );

    await getIt.isReady<UserCredentials>(instanceName: ServiceInstance.userCredentialsKey);
    userCredentials = getIt<UserCredentials>(instanceName: ServiceInstance.userCredentialsKey);

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
      log('\n\n UTILITY SERVICE IN INITIALIZED\n\n');
      return UtilityService();
    });

    getIt.registerLazySingleton(() {
      log('\n\nTIME SERVICE IN INITIALIZED\n\n');
      return TimeService();
    });
  }

  static void disposeService() {
    log('\n SERVICE IN DISPOSED\n\n');
    getIt.unregister<UserCredentials>(instanceName: ServiceInstance.userCredentialsKey);
    getIt.unregister<ScheduleService>();
    getIt.unregister<LogService>();
    getIt.unregister<ParseService>();
    getIt.unregister<TimeService>();
    getIt.unregister<UtilityService>();
  }
}
