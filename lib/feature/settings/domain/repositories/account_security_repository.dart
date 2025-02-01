/// Doc Required
abstract class AccountSecurityRepository<Setting> {
  /// Get account security settings
  Future<Setting> getAccountSecuritySettings(final String userId);

  /// Update account security settings
  Future<void> updateAccountSecuritySettings(
    final String userId,
    final Map<String, dynamic> securitySettings,
  );

  /// Enable or disable two-factor authentication
  Future<void> setTwoFactorAuthentication(
    final String userId, {
    required final bool enabled,
  });

  /// Change account password
  Future<void> changeAccountPassword(
    final String userId,
    final String newPassword,
  );
}
