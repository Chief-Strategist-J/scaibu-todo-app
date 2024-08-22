import 'package:todo_app/core/app_library.dart';

abstract interface class UserBaseApi {
  Future<LoginEntity> standardLogin(Map<String, dynamic> loginCred);

  Future<LoginEntity> standardSignUp(Map<String, dynamic> loginCred);

  Future<Either<FailResponse, LoginEntity>> getUserDetail(Map<String, dynamic> loginCred);

  Future<void> forgetPassword(Map<String, dynamic> forgetPasswordCred);

  Future<UserEntity> verifyForgetPasswordOtp(Map<String, dynamic> forgetPasswordCred);

  Future<void> updatePassword(Map<String, dynamic> updatePasswordCred);

  Future<bool> verifyOtp(Map<String, dynamic> verifyOtpCred);

  Future<bool> createOpt(Map<String, dynamic> otpCred);

  Future<void> standardLogOut(Map<String, dynamic> req);
}
