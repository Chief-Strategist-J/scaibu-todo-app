abstract class PushNotificationRepository<T> {
  // Send a push notification
  Future<void> sendPushNotification(
      final String title, final String message, final String recipientId);

  // Schedule a push notification
  Future<void> schedulePushNotification(
      final String title,
      final String message,
      final String recipientId,
      final DateTime scheduleTime);

  // Cancel a scheduled push notification
  Future<void> cancelScheduledPushNotification(final String notificationId);

  // Get status of a push notification
  Future<T> getPushNotificationStatus(final String notificationId);

  // Get push notification history for a user
  Future<List<T>> getPushNotificationHistory(final String userId);
}
