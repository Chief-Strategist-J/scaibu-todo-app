/// Doc Required
abstract interface class PomodoroRepository<T> {
  /// Doc Required
  Future<void> startPomodoro(final String pomodoroId);

  /// Doc Required
  Future<void> stopPomodoro(final String pomodoroId);

  /// Doc Required
  Future<void> resumePomodoro(final String pomodoroId);

  /// Doc Required
  Future<void> endPomodoro(final String pomodoroId);

  /// Doc Required
  Future<T> getPomodoroStats(final Map<String, dynamic> req);

  /// Doc Required
  Future<void> createPomodoro(final Map<String, dynamic> req);
}
