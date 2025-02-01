import 'package:todo_app/core/app_library.dart';

class PomodoroFirebaseApi implements PomodoroBase<PomodoroEntity> {
  @override
  Future<void> createPomodoro(final Map<String, dynamic> req) {
    throw UnimplementedError();
  }

  @override
  Future<void> endPomodoro(final String id) {
    throw UnimplementedError();
  }

  @override
  Future<PomodoroEntity> getPomodoroStats(final Map<String, dynamic> req) {
    throw UnimplementedError();
  }

  @override
  Future<void> resumePomodoro(final String id) {
    throw UnimplementedError();
  }

  @override
  Future<void> startPomodoro(final String id) {
    throw UnimplementedError();
  }

  @override
  Future<void> stopPomodoro(final String id) {
    throw UnimplementedError();
  }
}
