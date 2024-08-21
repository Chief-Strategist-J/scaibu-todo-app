import 'package:todo_app/core/app_library.dart';

class PomodoroRepositoryImpl implements PomodoroRepository<PomodoroEntity> {
  final PomodoroBase<PomodoroEntity> firebaseApi;
  final PomodoroBase<PomodoroEntity> databaseApi;

  PomodoroRepositoryImpl({required this.firebaseApi, required this.databaseApi});

  @override
  Future<void> createPomodoro(Map<String, dynamic> req) {
    throw UnimplementedError();
  }

  @override
  Future<void> endPomodoro(String id) {
    throw UnimplementedError();
  }

  @override
  Future<PomodoroEntity> getPomodoroStats(Map<String, dynamic> req) {
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
