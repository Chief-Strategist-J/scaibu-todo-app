import 'package:todo_app/core/app_library.dart';

/// A class that holds static constants related to service keys and
/// other configurations.
/// This class provides a central place for defining keys used across
/// the application.
class ServiceInstance {
  /// The key used to store and retrieve user credentials from persistent
  /// storage.
  /// This key is typically used in local storage or secure storage systems.
  static const String userCredentialsKey = 'userCredentials';
}

/// Setup Dependency
class Dependency {
  /// Initial setup
  static Future<void> setup() async {
    await ServiceDependencyInjection.registerService();
    TodoDependencyInjection.todoDependency();
    AuthDependencyInjection.authDependency();
    TagsDependencyInjection.setupDependencyInjection();
    PomodoroDependencyInjection.setupDependencyInjection();
    NotificationDependencyInjection.setupDependencyInjection();
    await NotificationAnalyticsDependencyInjection.setupDependencyInjection();
    NotificationEmailDependencyInjection.setupDependencyInjection();
    NotificationPushDependencyInjection.setupDependencyInjection();
    NotificationSMSDependencyInjection.setupDependencyInjection();
    NotificationWebhookDependencyInjection.setupDependencyInjection();
    ProjectDependencyInjection.setup();
  }

  /// dispose Dependency
  static Future<void> dispose() async {
    await ServiceDependencyInjection.disposeService();
    await TodoDependencyInjection.disposeDependencyInjection();
    await AuthDependencyInjection.disposeDependencyInjection();
    TagsDependencyInjection.disposeDependencyInjection();
    await PomodoroDependencyInjection.disposeDependencyInjection();
    await NotificationDependencyInjection.disposeDependencyInjection();
    await NotificationAnalyticsDependencyInjection.disposeDependencyInjection();
    await NotificationEmailDependencyInjection.disposeDependencyInjection();
    await NotificationPushDependencyInjection.disposeDependencyInjection();
    await NotificationSMSDependencyInjection.disposeDependencyInjection();
    await NotificationWebhookDependencyInjection.disposeDependencyInjection();
    ProjectDependencyInjection.dispose();
  }
}
