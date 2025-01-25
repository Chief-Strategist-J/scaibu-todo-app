/// Doc Required
abstract interface class GoogleAuthRepository {
  /// Doc Required
  Future<void> googleLogin(final Map<String, dynamic> loginCred);
  /// Doc Required
  Future<void> googleLogOut(final String userID);
}
