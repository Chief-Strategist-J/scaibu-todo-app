abstract class NotificationAnalyticsRepository<T> {
  // Track delivery status of notifications
  Future<void> trackNotificationDelivery(final String notificationId);

  // Track open rate of notifications
  Future<void> trackNotificationOpenRate(final String notificationId);

  // Get delivery and open rate statistics for notifications
  Future<T> getNotificationStatistics(final String userId);

  // Get notification engagement report
  Future<T> getNotificationEngagementReport(final String userId);

  // Get historical notification data
  Future<List<T>> getHistoricalNotificationData(
      final String userId, final DateTime startDate, final DateTime endDate);
}
