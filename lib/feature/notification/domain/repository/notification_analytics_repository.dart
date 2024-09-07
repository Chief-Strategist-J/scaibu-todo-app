abstract class NotificationAnalyticsRepository<T> {
  // Track delivery status of notifications
  Future<void> trackNotificationDelivery(String notificationId);

  // Track open rate of notifications
  Future<void> trackNotificationOpenRate(String notificationId);

  // Get delivery and open rate statistics for notifications
  Future<T> getNotificationStatistics(String userId);

  // Get notification engagement report
  Future<T> getNotificationEngagementReport(String userId);

  // Get historical notification data
  Future<List<T>> getHistoricalNotificationData(String userId, DateTime startDate, DateTime endDate);
}
