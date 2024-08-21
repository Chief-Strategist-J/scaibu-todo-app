import 'package:todo_app/core/app_library.dart';

final getIt = GetIt.instance;

class ServiceInstance {
  static const userCredentialsKey = 'userCredentials';
}

class Dependency {
  static void setup() {
    ServiceDependencyInjection.registerService();
    TodoDependencyInjection.todoDependency();
    AuthDependencyInjection.authDependency();
    TagsDependencyInjection.setupDependencyInjection();
    PomodoroDependencyInjection.setupDependencyInjection();
  }

  static void dispose() {
    ServiceDependencyInjection.disposeService();
    TodoDependencyInjection.disposeDependencyInjection();
    AuthDependencyInjection.disposeDependencyInjection();
    TagsDependencyInjection.disposeDependencyInjection();
    PomodoroDependencyInjection.disposeDependencyInjection();
  }
}
