import 'package:todo_app/core/app_library.dart';

/// Doc Required
class SmsNotificationImpl
    extends SMSNotificationRepository<NotificationEntity> {
  @override
  Future<void> cancelScheduledSMS(final String smsId) {
    // TO-DO: implement cancelScheduledSMS
    throw UnimplementedError();
  }

  @override
  Future<List<NotificationEntity>> getSMSHistory(final String userId) {
    // TO-DO: implement getSMSHistory
    throw UnimplementedError();
  }

  @override
  Future<NotificationEntity> getSMSStatus(final String smsId) {
    // TO-DO: implement getSMSStatus
    throw UnimplementedError();
  }

  @override
  Future<void> scheduleSMS(
    final String message,
    final String recipientPhoneNumber,
    final DateTime scheduleTime,
  ) {
    // TO-DO: implement scheduleSMS
    throw UnimplementedError();
  }

  @override
  Future<void> sendSMS(
    final String message,
    final String recipientPhoneNumber,
  ) {
    // TO-DO: implement sendSMS
    throw UnimplementedError();
  }
}
