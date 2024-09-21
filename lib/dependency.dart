import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/notification/notification_dependency_injection.dart';

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
    NotificationDependencyInjection.setupDependencyInjection();
    NotificationAnalyticsDependencyInjection.setupDependencyInjection();
    NotificationEmailDependencyInjection.setupDependencyInjection();
    NotificationPushDependencyInjection.setupDependencyInjection();
    NotificationSMSDependencyInjection.setupDependencyInjection();
    NotificationWebhookDependencyInjection.setupDependencyInjection();
  }

  static void dispose() {
    ServiceDependencyInjection.disposeService();
    TodoDependencyInjection.disposeDependencyInjection();
    AuthDependencyInjection.disposeDependencyInjection();
    TagsDependencyInjection.disposeDependencyInjection();
    PomodoroDependencyInjection.disposeDependencyInjection();
    NotificationDependencyInjection.disposeDependencyInjection();
    NotificationAnalyticsDependencyInjection.disposeDependencyInjection();
    NotificationEmailDependencyInjection.disposeDependencyInjection();
    NotificationPushDependencyInjection.disposeDependencyInjection();
    NotificationSMSDependencyInjection.disposeDependencyInjection();
    NotificationWebhookDependencyInjection.disposeDependencyInjection();
  }
}
