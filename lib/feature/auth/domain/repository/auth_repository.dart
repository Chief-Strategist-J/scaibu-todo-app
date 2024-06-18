import 'package:todo_app/core/todo_library.dart';

abstract interface class AuthRepository {
  // STORE USER DETAILS IN FIREBASE AND LARAVEL SIDE
  Future<void> registerUser(Map<String, dynamic> userData);

  Future<void> standardLogin(Map<String, dynamic> loginCred);

  Future<void> forgetPassword(Map<String, dynamic> forgetPasswordCred);

  Future<void> updatePassword(Map<String, dynamic> updatePasswordCred);

  Future<void> getUserDetail(String userID);

  Future<void> updateUserDetail(Map<String, dynamic> userDetail, String userID);

  Future<void> getUserTokens(String userID);

  Future<void> standardLogOut(String userID);
}
