abstract interface class FacebookAuthRepository {
  Future<void> facebookLogin(final Map<String, dynamic> loginCred);

  Future<void> facebookLogOut(final String userID);

}
