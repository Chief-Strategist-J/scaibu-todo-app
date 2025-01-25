import 'package:todo_app/core/app_library.dart';

/// Doc Required
abstract interface class UserBaseApi {
  /// Doc Required
  Future<LoginEntity> standardLogin(final Map<String, dynamic> loginCred);

  /// Doc Required
  Future<LoginEntity> standardSignUp(final Map<String, dynamic> loginCred);

  /// Doc Required
  Future<Either<FailResponse, LoginEntity>> getUserDetail(
    final Map<String, dynamic> loginCred,
  );

  /// Doc Required
  Future<void> forgetPassword(final Map<String, dynamic> forgetPasswordCred);

  /// Doc Required
  Future<UserEntity> verifyForgetPasswordOtp(
    final Map<String, dynamic> forgetPasswordCred,
  );

  /// Doc Required
  Future<void> updatePassword(final Map<String, dynamic> updatePasswordCred);

  /// Doc Required
  Future<bool> verifyOtp(final Map<String, dynamic> verifyOtpCred);

  /// Doc Required
  Future<bool> createOpt(final Map<String, dynamic> otpCred);

  /// Doc Required
  Future<void> standardLogOut(final Map<String, dynamic> req);
}
