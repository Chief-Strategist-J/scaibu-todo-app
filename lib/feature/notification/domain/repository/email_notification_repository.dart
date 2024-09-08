abstract class EmailNotificationRepository<T> {
  // Send an email notification
  Future<T> sendEmail(String subject, String body, String recipientEmail);

  // Schedule an email notification
  Future<T> scheduleEmail(String subject, String body, String recipientEmail, DateTime scheduleTime);

  // Cancel a scheduled email
  Future<T> cancelScheduledEmail(String emailId);

  // Get status of an email notification
  Future<T> getEmailStatus(String emailId);

  // Get email history for a user
  Future<List<T>> getEmailHistory(String userId);
}
