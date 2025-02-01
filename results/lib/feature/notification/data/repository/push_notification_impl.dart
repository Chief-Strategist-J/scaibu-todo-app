import 'package:todo_app/core/app_library.dart';

class PushNotificationImpl
    extends PushNotificationRepository<NotificationEntity> {
  @override
  Future<void> cancelScheduledPushNotification(final String notificationId) {
    // TODO: implement cancelScheduledPushNotification
    throw UnimplementedError();
  }

  @override
  Future<List<NotificationEntity>> getPushNotificationHistory(
      final String userId) {
    // TODO: implement getPushNotificationHistory
    throw UnimplementedError();
  }

  @override
  Future<NotificationEntity> getPushNotificationStatus(
      final String notificationId) {
    // TODO: implement getPushNotificationStatus
    throw UnimplementedError();
  }

  @override
  Future<void> schedulePushNotification(
    final String title,
    final String message,
    final String recipientId,
    final DateTime scheduleTime,
  ) {
    // TODO: implement schedulePushNotification
    throw UnimplementedError();
  }

  @override
  Future<void> sendPushNotification(
    final String title,
    final String message,
    final String recipientId,
  ) {
    // TODO: implement sendPushNotification
    throw UnimplementedError();
  }
}
