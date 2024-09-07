abstract class PomodoroPreferenceRepository<T> {
  // Get Pomodoro preferences
  Future<T> getPomodoroPreferences(String userId);

  // Update Pomodoro preferences
  Future<void> updatePomodoroPreferences(String userId, Map<String, dynamic> preferences);
}
