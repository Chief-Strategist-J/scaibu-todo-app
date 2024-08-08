import 'package:todo_app/core/app_library.dart';

class ServiceDependencyInjection {
  static void registerService() {
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

  static void disposeService() {
    getIt.unregister<UserCredentials>(instanceName: ServiceInstance.userCredentialsKey);
    getIt.unregister<ScheduleService>();
    getIt.unregister<LogService>();
    getIt.unregister<ParseService>();
    getIt.unregister<TimeService>();
  }
}
