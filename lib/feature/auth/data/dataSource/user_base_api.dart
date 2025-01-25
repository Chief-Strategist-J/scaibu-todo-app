import 'package:todo_app/core/app_library.dart';

abstract interface class UserBaseApi {
  Future<LoginEntity> standardLogin(final Map<String, dynamic> loginCred);

  Future<LoginEntity> standardSignUp(final Map<String, dynamic> loginCred);

  Future<Either<FailResponse, LoginEntity>> getUserDetail(
    final Map<String, dynamic> loginCred,
  );

  Future<void> forgetPassword(final Map<String, dynamic> forgetPasswordCred);

  Future<UserEntity> verifyForgetPasswordOtp(
    final Map<String, dynamic> forgetPasswordCred,
  );

  Future<void> updatePassword(final Map<String, dynamic> updatePasswordCred);

  Future<bool> verifyOtp(final Map<String, dynamic> verifyOtpCred);

  Future<bool> createOpt(final Map<String, dynamic> otpCred);

  Future<void> standardLogOut(final Map<String, dynamic> req);
}
