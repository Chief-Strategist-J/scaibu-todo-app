abstract interface class AuthUserBackupAndRecovery {
  Future<void> backUpUserData(final String userId);

  Future<void> restoreUserData(final String userId);

  Future<void> downloadUserData(final String userId);

  Future<void> logBackupActivity(final String userId);

  Future<void> logRecoveryActivity(final String userId);
}
