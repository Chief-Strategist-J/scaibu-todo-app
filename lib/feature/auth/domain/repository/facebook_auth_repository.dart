/// Doc Required
abstract interface class FacebookAuthRepository {
  /// Doc Required
  Future<void> facebookLogin(final Map<String, dynamic> loginCred);

  /// Doc Required
  Future<void> facebookLogOut(final String userID);
}
