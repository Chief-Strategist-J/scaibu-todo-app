/// Doc Required
abstract interface class AppleAuthRepository {
  /// Doc Required
  Future<void> appleLogin(final Map<String, dynamic> loginCred);

  /// Doc Required
  Future<void> appleLogOut(final String userID);
}
