import 'package:todo_app/core/app_library.dart';

/// Doc Required
class EmailNotificationImpl
    extends EmailNotificationRepository<NotificationEntity> {
  @override
  Future<NotificationEntity> cancelScheduledEmail(final String emailId) {
    // TO-DO: implement cancelScheduledEmail
    throw UnimplementedError();
  }

  @override
  Future<List<NotificationEntity>> getEmailHistory(final String userId) {
    // TO-DO: implement getEmailHistory
    throw UnimplementedError();
  }

  @override
  Future<NotificationEntity> getEmailStatus(final String emailId) {
    // TO-DO: implement getEmailStatus
    throw UnimplementedError();
  }

  @override
  Future<NotificationEntity> scheduleEmail(
    final String subject,
    final String body,
    final String recipientEmail,
    final DateTime scheduleTime,
  ) {
    // TO-DO: implement scheduleEmail
    throw UnimplementedError();
  }

  @override
  Future<NotificationEntity> sendEmail(
    final String subject,
    final String body,
    final String recipientEmail,
  ) {
    // TO-DO: implement sendEmail
    throw UnimplementedError();
  }
}
