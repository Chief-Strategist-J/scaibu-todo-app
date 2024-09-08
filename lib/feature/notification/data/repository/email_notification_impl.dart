import 'package:todo_app/core/app_library.dart';

class EmailNotificationImpl extends EmailNotificationRepository<NotificationEntity> {
  @override
  Future<NotificationEntity> cancelScheduledEmail(String emailId) {
    // TODO: implement cancelScheduledEmail
    throw UnimplementedError();
  }

  @override
  Future<List<NotificationEntity>> getEmailHistory(String userId) {
    // TODO: implement getEmailHistory
    throw UnimplementedError();
  }

  @override
  Future<NotificationEntity> getEmailStatus(String emailId) {
    // TODO: implement getEmailStatus
    throw UnimplementedError();
  }

  @override
  Future<NotificationEntity> scheduleEmail(String subject, String body, String recipientEmail, DateTime scheduleTime) {
    // TODO: implement scheduleEmail
    throw UnimplementedError();
  }

  @override
  Future<NotificationEntity> sendEmail(String subject, String body, String recipientEmail) {
    // TODO: implement sendEmail
    throw UnimplementedError();
  }
}
