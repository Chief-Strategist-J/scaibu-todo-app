/// Doc Required
abstract class DataAnalyticsRepository<T> {
  /// Get data analytics
  Future<T> getDataAnalytics(final String userId);

  /// Update data analytics settings
  Future<void> updateDataAnalyticsSettings(
    final String userId,
    final Map<String, dynamic> settings,
  );

  /// Get historical data
  Future<List<T>> getHistoricalData(
    final String userId,
    final DateTime startDate,
    final DateTime endDate,
  );
}
