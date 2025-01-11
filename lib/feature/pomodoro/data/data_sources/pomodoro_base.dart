abstract interface class PomodoroBase<T> {
  Future<void> startPomodoro(final String id);

  Future<void> stopPomodoro(final String id);

  Future<void> resumePomodoro(final String id);

  Future<void> endPomodoro(final String id);

  Future<T> getPomodoroStats(final Map<String, dynamic> req);

  Future<void> createPomodoro(final Map<String, dynamic> req);
}
