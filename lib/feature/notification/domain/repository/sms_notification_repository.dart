abstract class SMSNotificationRepository<T> {
  // Send an SMS notification
  Future<void> sendSMS(String message, String recipientPhoneNumber);

  // Schedule an SMS notification
  Future<void> scheduleSMS(String message, String recipientPhoneNumber, DateTime scheduleTime);

  // Cancel a scheduled SMS
  Future<void> cancelScheduledSMS(String smsId);

  // Get status of an SMS notification
  Future<T> getSMSStatus(String smsId);

  // Get SMS history for a user
  Future<List<T>> getSMSHistory(String userId);
}
