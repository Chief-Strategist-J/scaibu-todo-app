import 'package:todo_app/core/app_library.dart';

/// Doc Required
class PushNotificationImpl
    extends PushNotificationRepository<NotificationEntity> {
  @override
  Future<void> cancelScheduledPushNotification(final String notificationId) {
    // TO-DO: implement cancelScheduledPushNotification
    throw UnimplementedError();
  }

  @override
  Future<List<NotificationEntity>> getPushNotificationHistory(
    final String userId,
  ) {
    // TO-DO: implement getPushNotificationHistory
    throw UnimplementedError();
  }

  @override
  Future<NotificationEntity> getPushNotificationStatus(
    final String notificationId,
  ) {
    // TO-DO: implement getPushNotificationStatus
    throw UnimplementedError();
  }

  @override
  Future<void> schedulePushNotification(
    final String title,
    final String message,
    final String recipientId,
    final DateTime scheduleTime,
  ) {
    // TO-DO: implement schedulePushNotification
    throw UnimplementedError();
  }

  @override
  Future<void> sendPushNotification(
    final String title,
    final String message,
    final String recipientId,
  ) {
    // TO-DO: implement sendPushNotification
    throw UnimplementedError();
  }
}
