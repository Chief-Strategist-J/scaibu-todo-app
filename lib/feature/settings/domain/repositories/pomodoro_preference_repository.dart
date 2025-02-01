/// Doc Required
abstract class PomodoroPreferenceRepository<T> {
  /// Get Pomodoro preferences
  Future<T> getPomodoroPreferences(final String userId);

  /// Update Pomodoro preferences
  Future<void> updatePomodoroPreferences(
    final String userId,
    final Map<String, dynamic> preferences,
  );
}
