/// Doc Required
abstract class SMSNotificationRepository<T> {
  /// Send an SMS notification
  Future<void> sendSMS(final String message, final String recipientPhoneNumber);

  /// Schedule an SMS notification
  Future<void> scheduleSMS(
    final String message,
    final String recipientPhoneNumber,
    final DateTime scheduleTime,
  );

  /// Cancel a scheduled SMS
  Future<void> cancelScheduledSMS(final String smsId);

  /// Get status of an SMS notification
  Future<T> getSMSStatus(final String smsId);

  /// Get SMS history for a user
  Future<List<T>> getSMSHistory(final String userId);
}
