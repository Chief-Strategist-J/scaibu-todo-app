import 'package:todo_app/core/app_library.dart';

class PushNotificationImpl extends PushNotificationRepository{
  @override
  Future<void> cancelScheduledPushNotification(String notificationId) {
    // TODO: implement cancelScheduledPushNotification
    throw UnimplementedError();
  }

  @override
  Future<List> getPushNotificationHistory(String userId) {
    // TODO: implement getPushNotificationHistory
    throw UnimplementedError();
  }

  @override
  Future getPushNotificationStatus(String notificationId) {
    // TODO: implement getPushNotificationStatus
    throw UnimplementedError();
  }

  @override
  Future<void> schedulePushNotification(String title, String message, String recipientId, DateTime scheduleTime) {
    // TODO: implement schedulePushNotification
    throw UnimplementedError();
  }

  @override
  Future<void> sendPushNotification(String title, String message, String recipientId) {
    // TODO: implement sendPushNotification
    throw UnimplementedError();
  }
}