abstract interface class AppleAuthRepository {
  Future<void> appleLogin(final Map<String, dynamic> loginCred);

  Future<void> appleLogOut(final String userID);
}
