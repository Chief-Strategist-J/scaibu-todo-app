abstract class EmailNotificationRepository {
  // Send an email notification
  Future<void> sendEmail(String subject, String body, String recipientEmail);

  // Schedule an email notification
  Future<void> scheduleEmail(String subject, String body, String recipientEmail, DateTime scheduleTime);

  // Cancel a scheduled email
  Future<void> cancelScheduledEmail(String emailId);

  // Get status of an email notification
  Future<String> getEmailStatus(String emailId);

  // Get email history for a user
  Future<List<Map<String, dynamic>>> getEmailHistory(String userId);
}
