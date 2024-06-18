abstract interface class GoogleAuthRepository {
  Future<void> googleLogin(Map<String, dynamic> loginCred);

  Future<void> googleLogOut(String userID);
}
