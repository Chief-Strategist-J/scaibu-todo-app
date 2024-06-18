// MOVE TO BACKEND SIDE
abstract interface class AuthNotificationRepository {
  Future<void> welcomeNotification(Map<String, dynamic> payload, String userId);

  Future<void> sendLoginNotification(Map<String, dynamic> payload, String userId);

  Future<void> sendPasswordUpdatedNotification(Map<String, dynamic> payload, String userId);

  Future<void> sendLoginOutNotification(Map<String, dynamic> payload, String userId);

  Future<void> sendSecurityAlertNotification(Map<String, dynamic> payload, String userId);
}
