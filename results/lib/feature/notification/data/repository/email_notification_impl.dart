import 'package:todo_app/core/app_library.dart';

class EmailNotificationImpl
    extends EmailNotificationRepository<NotificationEntity> {
  @override
  Future<NotificationEntity> cancelScheduledEmail(final String emailId) {
    // TODO: implement cancelScheduledEmail
    throw UnimplementedError();
  }

  @override
  Future<List<NotificationEntity>> getEmailHistory(final String userId) {
    // TODO: implement getEmailHistory
    throw UnimplementedError();
  }

  @override
  Future<NotificationEntity> getEmailStatus(final String emailId) {
    // TODO: implement getEmailStatus
    throw UnimplementedError();
  }

  @override
  Future<NotificationEntity> scheduleEmail(
      final String subject,
      final String body,
      final String recipientEmail,
      final DateTime scheduleTime) {
    // TODO: implement scheduleEmail
    throw UnimplementedError();
  }

  @override
  Future<NotificationEntity> sendEmail(
      final String subject, final String body, final String recipientEmail) {
    // TODO: implement sendEmail
    throw UnimplementedError();
  }
}
