/// Doc Required
abstract class DateTimeRepository<T> {
  /// Get date and time settings
  Future<T> getDateTimeSettings();

  /// Update date and time settings
  Future<void> updateDateTimeSettings(final Map<String, dynamic> settings);

  /// Convert date and time to different formats
  Future<String> convertDateTime(final String format, final DateTime dateTime);
}
