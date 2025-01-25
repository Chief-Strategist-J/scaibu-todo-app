/// Doc Required
abstract interface class AuthSecurityRepository {
  /// Doc Required
  Future<void> verifyEmail(final String email);
  /// Doc Required
  Future<void> verifyContactNumber(final String contactNumber);
}
