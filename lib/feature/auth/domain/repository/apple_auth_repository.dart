abstract interface class AppleAuthRepository {
  Future<void> appleLogin(Map<String, dynamic> loginCred);

  Future<void> appleLogOut(String userID);
}
