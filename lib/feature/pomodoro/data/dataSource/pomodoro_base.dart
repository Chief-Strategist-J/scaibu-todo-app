/// Doc Required
abstract interface class PomodoroBase<T> {
  /// Doc Required

  Future<void> startPomodoro(final String id);

  /// Doc Required

  Future<void> stopPomodoro(final String id);

  /// Doc Required

  Future<void> resumePomodoro(final String id);

  /// Doc Required

  Future<void> endPomodoro(final String id);

  /// Doc Required

  Future<T> getPomodoroStats(final Map<String, dynamic> req);

  /// Doc Required

  Future<void> createPomodoro(final Map<String, dynamic> req);
}
