import 'package:todo_app/core/app_library.dart';

class PomodoroRepositoryImpl implements PomodoroRepository<PomodoroEntity> {
  PomodoroRepositoryImpl(
      {required this.firebaseApi, required this.databaseApi});

  final PomodoroBase<PomodoroEntity> firebaseApi;
  final PomodoroBase<PomodoroEntity> databaseApi;

  @override
  Future<void> createPomodoro(final Map<String, dynamic> req) async {
    await databaseApi.createPomodoro(req);
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
