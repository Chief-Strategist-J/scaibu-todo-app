// MOVE TO BACKEND SIDE
abstract interface class AuthNotificationRepository {
  Future<void> welcomeNotification(
      final Map<String, dynamic> payload, final String userId);

  Future<void> sendLoginNotification(
      final Map<String, dynamic> payload, final String userId);

  Future<void> sendPasswordUpdatedNotification(
      final Map<String, dynamic> payload, final String userId);

  Future<void> sendLoginOutNotification(
      final Map<String, dynamic> payload, final String userId);

  Future<void> sendSecurityAlertNotification(
      final Map<String, dynamic> payload, final String userId);
}
