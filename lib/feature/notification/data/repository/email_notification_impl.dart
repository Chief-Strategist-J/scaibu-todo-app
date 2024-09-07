import 'package:todo_app/feature/notification/domain/repository/email_notification_repository.dart';

class EmailNotificationImpl extends EmailNotificationRepository{
  @override
  Future<void> cancelScheduledEmail(String emailId) {
    // TODO: implement cancelScheduledEmail
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getEmailHistory(String userId) {
    // TODO: implement getEmailHistory
    throw UnimplementedError();
  }

  @override
  Future<String> getEmailStatus(String emailId) {
    // TODO: implement getEmailStatus
    throw UnimplementedError();
  }

  @override
  Future<void> scheduleEmail(String subject, String body, String recipientEmail, DateTime scheduleTime) {
    // TODO: implement scheduleEmail
    throw UnimplementedError();
  }

  @override
  Future<void> sendEmail(String subject, String body, String recipientEmail) {
    // TODO: implement sendEmail
    throw UnimplementedError();
  }
}