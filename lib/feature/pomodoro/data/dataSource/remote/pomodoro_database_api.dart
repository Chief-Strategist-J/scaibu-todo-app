import 'package:todo_app/core/app_library.dart';

/// Doc Required

class PomodoroPoint {
  PomodoroPoint._();

  /// Doc Required
  /// Doc Required

  static const String createBulkPomodoros = 'api/pomodoro/createBulkPomodoros';

  /// Doc Required

  static const String endPomodoro = 'api/pomodoro/endPomodoro';

  /// Doc Required

  static const String getPomodoroStats = 'api/pomodoro/getPomodoroStats';

  /// Doc Required

  static const String resumePomodoro = 'api/pomodoro/resumePomodoro';

  /// Doc Required

  static const String startPomodoro = 'api/pomodoro/startPomodoro';

  /// Doc Required

  static const String stopPomodoro = 'api/pomodoro/stopPomodoro';
}

/// Doc Required
class PomodoroDatabaseApi implements PomodoroBase<PomodoroEntity> {
  /// Doc Required

  PomodoroDatabaseApi({required this.restApi});

  /// Doc Required
  final RestApi restApi;

  @override
  Future<void> createPomodoro(final Map<String, dynamic> req) async {
    await restApi.request<dynamic>(
      endPoint: PomodoroPoint.createBulkPomodoros,
      requestBody: req,
      type: HttpRequestMethod.post,
    );
  }

  @override
  Future<void> endPomodoro(final String id) async {
    await restApi.request<dynamic>(
      endPoint: PomodoroPoint.endPomodoro,
      requestBody: <String, String>{'pomodoro_id': id},
      type: HttpRequestMethod.post,
    );
  }

  @override
  Future<PomodoroEntity> getPomodoroStats(
    final Map<String, dynamic> req,
  ) async {
    await restApi.request<dynamic>(
      endPoint: PomodoroPoint.getPomodoroStats,
      requestBody: req,
      type: HttpRequestMethod.post,
    );

    throw UnimplementedError();
  }

  @override
  Future<void> resumePomodoro(final String id) async {
    await restApi.request<dynamic>(
      endPoint: PomodoroPoint.resumePomodoro,
      requestBody: <String, dynamic>{'pomodoro_id': id},
      type: HttpRequestMethod.post,
    );
  }

  @override
  Future<void> startPomodoro(final String id) async {
    await restApi.request<dynamic>(
      endPoint: PomodoroPoint.startPomodoro,
      requestBody: <String, dynamic>{'pomodoro_id': id},
      type: HttpRequestMethod.post,
    );
  }

  @override
  Future<void> stopPomodoro(final String id) async {
    await restApi.request<dynamic>(
      endPoint: PomodoroPoint.startPomodoro,
      requestBody: <String, dynamic>{'pomodoro_id': id},
      type: HttpRequestMethod.post,
    );
  }
}
