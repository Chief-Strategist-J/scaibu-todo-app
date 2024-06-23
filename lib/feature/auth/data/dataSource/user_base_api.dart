import 'package:todo_app/core/app_library.dart';

abstract interface class UserBaseApi {
  Future<UserEntity> registerUser(Map<String, dynamic> userData);

  Future<LoginEntity> standardLogin(Map<String, dynamic> loginCred);

  Future<LoginEntity> standardSignUp(Map<String, dynamic> loginCred);

  Future<void> forgetPassword(Map<String, dynamic> forgetPasswordCred);

  Future<void> verifyForgetPasswordOtp(Map<String, dynamic> forgetPasswordCred);

  Future<void> updatePassword(Map<String, dynamic> updatePasswordCred);

  Future<bool> verifyOtp(String otp);

  Future<UserEntity> getUserDetail(String userID);

  Future<UserEntity> updateUserDetail(Map<String, dynamic> userDetail, String userID);

  Future<void> standardLogOut(String userID);
}
