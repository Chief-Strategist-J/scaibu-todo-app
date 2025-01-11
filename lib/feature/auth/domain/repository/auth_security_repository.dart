abstract interface class AuthSecurityRepository {
  Future<void> verifyEmail(final String email);

  Future<void> verifyContactNumber(final String contactNumber);
}
