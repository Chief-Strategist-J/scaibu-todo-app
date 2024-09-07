abstract class ApplicationSettingsRepository<T> {
  // Get application settings
  Future<T> getApplicationSettings();

  // Update application settings
  Future<void> updateApplicationSettings(Map<String, dynamic> settings);

  // Reset application settings to default
  Future<void> resetApplicationSettings();
}
