abstract class AccountSecurityRepository<T> {
  // Get account security settings
  Future<T> getAccountSecuritySettings(String userId);

  // Update account security settings
  Future<void> updateAccountSecuritySettings(String userId, Map<String, dynamic> securitySettings);

  // Enable or disable two-factor authentication
  Future<void> setTwoFactorAuthentication(String userId, bool enabled);

  // Change account password
  Future<void> changeAccountPassword(String userId, String newPassword);
}
