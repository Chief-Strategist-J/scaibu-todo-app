import 'package:todo_app/core/app_library.dart';

class PomodoroDatabaseApi implements PomodoroBase<PomodoroModel> {
  @override
  Future<void> createPomodoro(Map<String, dynamic> req) {
    throw UnimplementedError();
  }

  @override
  Future<void> endPomodoro(String id) {
    throw UnimplementedError();
  }

  @override
  Future<PomodoroModel> getPomodoroStats(Map<String, dynamic> req) {
    throw UnimplementedError();
  }

  @override
  Future<void> resumePomodoro(String id) {
    throw UnimplementedError();
  }

  @override
  Future<void> startPomodoro(String id) {
    throw UnimplementedError();
  }

  @override
  Future<void> stopPomodoro(String id) {
    throw UnimplementedError();
  }
}
