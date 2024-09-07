abstract class DateTimeRepository<T> {
  // Get date and time settings
  Future<T> getDateTimeSettings();

  // Update date and time settings
  Future<void> updateDateTimeSettings(Map<String, dynamic> settings);

  // Convert date and time to different formats
  Future<String> convertDateTime(String format, DateTime dateTime);
}
