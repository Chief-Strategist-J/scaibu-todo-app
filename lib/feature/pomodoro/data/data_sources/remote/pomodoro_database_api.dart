import 'package:todo_app/core/app_library.dart';

class PomodoroPoint {
  static const String createBulkPomodoros = 'api/pomodoro/createBulkPomodoros';
  static const String endPomodoro = 'api/pomodoro/endPomodoro';
  static const String getPomodoroStats = 'api/pomodoro/getPomodoroStats';
  static const String resumePomodoro = 'api/pomodoro/resumePomodoro';
  static const String startPomodoro = 'api/pomodoro/startPomodoro';
  static const String stopPomodoro = 'api/pomodoro/stopPomodoro';

  PomodoroPoint._();
}

class PomodoroDatabaseApi implements PomodoroBase<PomodoroEntity> {
  final RestApi restApi;

  PomodoroDatabaseApi({required this.restApi});

  @override
  Future<void> createPomodoro(Map<String, dynamic> req) async {
    await restApi.request(
      endPoint: PomodoroPoint.createBulkPomodoros,
      requestBody: req,
      type: HttpRequestMethod.post,
    );
  }

  @override
  Future<void> endPomodoro(String id) async {
    await restApi.request(
      endPoint: PomodoroPoint.endPomodoro,
      requestBody: {"pomodoro_id": id},
      type: HttpRequestMethod.post,
    );
  }

  @override
  Future<PomodoroEntity> getPomodoroStats(Map<String, dynamic> req) async {
    await restApi.request(
      endPoint: PomodoroPoint.getPomodoroStats,
      requestBody: req,
      type: HttpRequestMethod.post,
    );
    
    throw UnimplementedError();
  }

  @override
  Future<void> resumePomodoro(String id) async {
    await restApi.request(
      endPoint: PomodoroPoint.resumePomodoro,
      requestBody: {"pomodoro_id": id},
      type: HttpRequestMethod.post,
    );
  }

  @override
  Future<void> startPomodoro(String id) async {
    await restApi.request(
      endPoint: PomodoroPoint.startPomodoro,
      requestBody: {"pomodoro_id": id},
      type: HttpRequestMethod.post,
    );
  }

  @override
  Future<void> stopPomodoro(String id) async {
    await restApi.request(
      endPoint: PomodoroPoint.startPomodoro,
      requestBody: {"pomodoro_id": id},
      type: HttpRequestMethod.post,
    );
  }
}
