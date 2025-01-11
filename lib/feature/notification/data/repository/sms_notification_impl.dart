import 'package:todo_app/core/app_library.dart';

class SmsNotificationImpl
    extends SMSNotificationRepository<NotificationEntity> {
  @override
  Future<void> cancelScheduledSMS(final String smsId) {
    // TODO: implement cancelScheduledSMS
    throw UnimplementedError();
  }

  @override
  Future<List<NotificationEntity>> getSMSHistory(final String userId) {
    // TODO: implement getSMSHistory
    throw UnimplementedError();
  }

  @override
  Future<NotificationEntity> getSMSStatus(final String smsId) {
    // TODO: implement getSMSStatus
    throw UnimplementedError();
  }

  @override
  Future<void> scheduleSMS(final String message,
      final String recipientPhoneNumber, final DateTime scheduleTime) {
    // TODO: implement scheduleSMS
    throw UnimplementedError();
  }

  @override
  Future<void> sendSMS(
      final String message, final String recipientPhoneNumber) {
    // TODO: implement sendSMS
    throw UnimplementedError();
  }
}
