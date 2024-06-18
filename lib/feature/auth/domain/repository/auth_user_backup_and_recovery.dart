abstract interface class AuthUserBackupAndRecovery {
  Future<void> backUpUserData(String userId);

  Future<void> restoreUserData(String userId);

  Future<void> downloadUserData(String userId);

  Future<void> logBackupActivity(String userId);

  Future<void> logRecoveryActivity(String userId);
}
