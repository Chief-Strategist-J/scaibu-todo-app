// MOVE TO BACKEND SIDE
/// Doc Required
abstract interface class AuthNotificationRepository {
  /// Doc Required
  Future<void> welcomeNotification(
    final Map<String, dynamic> payload,
    final String userId,
  );

  /// Doc Required
  Future<void> sendLoginNotification(
    final Map<String, dynamic> payload,
    final String userId,
  );

  /// Doc Required
  Future<void> sendPasswordUpdatedNotification(
    final Map<String, dynamic> payload,
    final String userId,
  );

  /// Doc Required
  Future<void> sendLoginOutNotification(
    final Map<String, dynamic> payload,
    final String userId,
  );

  /// Doc Required
  Future<void> sendSecurityAlertNotification(
    final Map<String, dynamic> payload,
    final String userId,
  );
}
