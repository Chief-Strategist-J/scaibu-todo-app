/// Doc Required
abstract interface class AuthUserBackupAndRecovery {
  /// Doc Required
  Future<void> backUpUserData(final String userId);

  /// Doc Required
  Future<void> restoreUserData(final String userId);

  /// Doc Required
  Future<void> downloadUserData(final String userId);

  /// Doc Required
  Future<void> logBackupActivity(final String userId);

  /// Doc Required
  Future<void> logRecoveryActivity(final String userId);
}
