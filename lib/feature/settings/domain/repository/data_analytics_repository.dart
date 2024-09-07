abstract class DataAnalyticsRepository<T> {
  // Get data analytics
  Future<T> getDataAnalytics(String userId);

  // Update data analytics settings
  Future<void> updateDataAnalyticsSettings(String userId, Map<String, dynamic> settings);

  // Get historical data
  Future<List<T>> getHistoricalData(String userId, DateTime startDate, DateTime endDate);
}
