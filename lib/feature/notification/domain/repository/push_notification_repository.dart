abstract class PushNotificationRepository<T> {
  // Send a push notification
  Future<void> sendPushNotification(String title, String message, String recipientId);

  // Schedule a push notification
  Future<void> schedulePushNotification(String title, String message, String recipientId, DateTime scheduleTime);

  // Cancel a scheduled push notification
  Future<void> cancelScheduledPushNotification(String notificationId);

  // Get status of a push notification
  Future<T> getPushNotificationStatus(String notificationId);

  // Get push notification history for a user
  Future<List<T>> getPushNotificationHistory(String userId);
}
