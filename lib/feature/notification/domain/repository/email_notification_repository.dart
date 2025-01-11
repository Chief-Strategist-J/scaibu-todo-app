abstract class EmailNotificationRepository<T> {
  // Send an email notification
  Future<T> sendEmail(
      final String subject, final String body, final String recipientEmail);

  // Schedule an email notification
  Future<T> scheduleEmail(final String subject, final String body,
      final String recipientEmail, final DateTime scheduleTime);

  // Cancel a scheduled email
  Future<T> cancelScheduledEmail(final String emailId);

  // Get status of an email notification
  Future<T> getEmailStatus(final String emailId);

  // Get email history for a user
  Future<List<T>> getEmailHistory(final String userId);
}
