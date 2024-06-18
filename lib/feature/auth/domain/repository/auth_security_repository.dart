abstract interface class AuthSecurityRepository {
  Future<void> verifyEmail(String email);

  Future<void> verifyContactNumber(String contactNumber);
}
