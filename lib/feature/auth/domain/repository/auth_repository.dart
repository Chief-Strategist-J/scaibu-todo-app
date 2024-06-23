import 'package:todo_app/core/app_library.dart';

abstract interface class AuthRepository {
  Future<LoginEntity> standardSignIn(Map<String, dynamic> loginCred);

  Future<LoginEntity> standardSignUp(Map<String, dynamic> loginCred);

  Future<void> forgetPassword(Map<String, dynamic> forgetPasswordCred);

  Future<UserEntity> verifyForgetPasswordOtp(Map<String, dynamic> forgetPasswordCred);

  Future<void> updatePassword(Map<String, dynamic> updatePasswordCred);

  Future<bool> createOpt(Map<String, dynamic> otpCred);

  Future<bool> verifyOtp(Map<String, dynamic> verifyOtpCred);

  Future<void> standardLogOut(String userID);
}
