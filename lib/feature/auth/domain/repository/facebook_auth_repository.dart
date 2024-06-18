abstract interface class FacebookAuthRepository {
  Future<void> facebookLogin(Map<String, dynamic> loginCred);

  Future<void> facebookLogOut(String userID);

}
