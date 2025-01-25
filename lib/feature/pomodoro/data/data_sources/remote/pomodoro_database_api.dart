import 'package:todo_app/core/app_library.dart';

class PomodoroPoint {
  PomodoroPoint._();
  static const String createBulkPomodoros = 'api/pomodoro/createBulkPomodoros';
  static const String endPomodoro = 'api/pomodoro/endPomodoro';
  static const String getPomodoroStats = 'api/pomodoro/getPomodoroStats';
  static const String resumePomodoro = 'api/pomodoro/resumePomodoro';
  static const String startPomodoro = 'api/pomodoro/startPomodoro';
  static const String stopPomodoro = 'api/pomodoro/stopPomodoro';
}

class PomodoroDatabaseApi implements PomodoroBase<PomodoroEntity> {
  PomodoroDatabaseApi({required this.restApi});
  final RestApi restApi;

  @override
  Future<void> createPomodoro(final Map<String, dynamic> req) async {
    await restApi.request(
      endPoint: PomodoroPoint.createBulkPomodoros,
      requestBody: req,
      type: HttpRequestMethod.post,
    );
  }

  @override
  Future<void> endPomodoro(final String id) async {
    await restApi.request(
      endPoint: PomodoroPoint.endPomodoro,
      requestBody: {"pomodoro_id": id},
      type: HttpRequestMethod.post,
    );
  }

  @override
  Future<PomodoroEntity> getPomodoroStats(
      final Map<String, dynamic> req) async {
    await restApi.request(
      endPoint: PomodoroPoint.getPomodoroStats,
      requestBody: req,
      type: HttpRequestMethod.post,
    );

    throw UnimplementedError();
  }

  @override
  Future<void> resumePomodoro(final String id) async {
    await restApi.request(
      endPoint: PomodoroPoint.resumePomodoro,
      requestBody: <String, dynamic>{"pomodoro_id": id},
      type: HttpRequestMethod.post,
    );
  }

  @override
  Future<void> startPomodoro(final String id) async {
    await restApi.request(
      endPoint: PomodoroPoint.startPomodoro,
      requestBody: <String, dynamic>{"pomodoro_id": id},
      type: HttpRequestMethod.post,
    );
  }

  @override
  Future<void> stopPomodoro(final String id) async {
    await restApi.request(
      endPoint: PomodoroPoint.startPomodoro,
      requestBody: <String, dynamic>{"pomodoro_id": id},
      type: HttpRequestMethod.post,
    );
  }
}
