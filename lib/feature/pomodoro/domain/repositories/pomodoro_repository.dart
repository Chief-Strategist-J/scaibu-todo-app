abstract interface class PomodoroRepository<T> {
  Future<void> startPomodoro(final String pomodoroId);

  Future<void> stopPomodoro(final String pomodoroId);

  Future<void> resumePomodoro(final String pomodoroId);

  Future<void> endPomodoro(final String pomodoroId);

  Future<T> getPomodoroStats(final Map<String, dynamic> req);

  Future<void> createPomodoro(final Map<String, dynamic> req);
}
