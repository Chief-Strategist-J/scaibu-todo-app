abstract interface class PomodoroRepository<T> {
  Future<void> startPomodoro(String pomodoroId);

  Future<void> stopPomodoro(String pomodoroId);

  Future<void> resumePomodoro(String pomodoroId);

  Future<void> endPomodoro(String pomodoroId);

  Future<T> getPomodoroStats(Map<String, dynamic> req);

  Future<void> createPomodoro(Map<String, dynamic> req);
}
