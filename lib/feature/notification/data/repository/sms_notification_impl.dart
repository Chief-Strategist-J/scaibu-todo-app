import 'package:todo_app/core/app_library.dart';

class SmsNotificationImpl extends SMSNotificationRepository{
  @override
  Future<void> cancelScheduledSMS(String smsId) {
    // TODO: implement cancelScheduledSMS
    throw UnimplementedError();
  }

  @override
  Future<List> getSMSHistory(String userId) {
    // TODO: implement getSMSHistory
    throw UnimplementedError();
  }

  @override
  Future getSMSStatus(String smsId) {
    // TODO: implement getSMSStatus
    throw UnimplementedError();
  }

  @override
  Future<void> scheduleSMS(String message, String recipientPhoneNumber, DateTime scheduleTime) {
    // TODO: implement scheduleSMS
    throw UnimplementedError();
  }

  @override
  Future<void> sendSMS(String message, String recipientPhoneNumber) {
    // TODO: implement sendSMS
    throw UnimplementedError();
  }
}