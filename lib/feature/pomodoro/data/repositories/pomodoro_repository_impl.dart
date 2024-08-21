import 'package:todo_app/feature/pomodoro/data/data_sources/pomodoro_base.dart';
import 'package:todo_app/feature/pomodoro/data/models/pomodoro_model.dart';
import 'package:todo_app/feature/pomodoro/domain/repositories/pomodoro_repository.dart';

class PomodoroRepositoryImpl implements PomodoroRepository<PomodoroModel> {
  final PomodoroBase<PomodoroModel> firebaseApi;
  final PomodoroBase<PomodoroModel> databaseApi;

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
