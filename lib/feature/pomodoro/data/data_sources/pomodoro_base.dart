abstract interface class PomodoroBase<T> {
  Future<void> startPomodoro(String id);

  Future<void> stopPomodoro(String id);

  Future<void> resumePomodoro(String id);

  Future<void> endPomodoro(String id);

  Future<T> getPomodoroStats(Map<String, dynamic> req);

  Future<void> createPomodoro(Map<String, dynamic> req);
}
