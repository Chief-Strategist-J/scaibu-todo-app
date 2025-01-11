abstract interface class GoogleAuthRepository {
  Future<void> googleLogin(final Map<String, dynamic> loginCred);

  Future<void> googleLogOut(final String userID);
}
