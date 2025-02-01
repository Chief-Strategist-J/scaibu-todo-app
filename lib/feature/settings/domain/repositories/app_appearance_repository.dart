/// Doc Required
abstract class AppAppearanceRepository<T> {
  /// Get app appearance settings
  Future<T> getAppAppearanceSettings();

  /// Update app appearance settings
  Future<void> updateAppAppearanceSettings(
    final Map<String, dynamic> appearanceSettings,
  );
}
