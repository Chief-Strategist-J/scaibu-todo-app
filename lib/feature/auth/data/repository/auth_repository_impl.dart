import 'package:todo_app/core/app_library.dart';

class AuthRepositoryImpl implements AuthRepository {
  final UserBaseApi baseApi;

  AuthRepositoryImpl({required this.baseApi});

  @override
  Future<void> forgetPassword(Map<String, dynamic> forgetPasswordCred) {
    return baseApi.forgetPassword(forgetPasswordCred);
  }

  @override
  Future<void> standardLogOut(String userID) {
    return baseApi.standardLogOut(userID);
  }

  @override
  Future<LoginEntity> standardSignIn(Map<String, dynamic> loginCred) {
    return baseApi.standardLogin(loginCred);
  }

  @override
  Future<void> updatePassword(Map<String, dynamic> updatePasswordCred) {
    return baseApi.updatePassword(updatePasswordCred);
  }

  @override
  Future<bool> verifyOtp(Map<String, dynamic> verifyOtpCred) {
    return baseApi.verifyOtp(verifyOtpCred);
  }

  @override
  Future<UserEntity> verifyForgetPasswordOtp(Map<String, dynamic> forgetPasswordCred) {
    return baseApi.verifyForgetPasswordOtp(forgetPasswordCred);
  }

  @override
  Future<LoginEntity> standardSignUp(Map<String, dynamic> loginCred) {
    throw UnimplementedError();
  }

  @override
  Future<bool> createOpt(Map<String, dynamic> otpCred) {
    // TODO: implement createOpt
    throw UnimplementedError();
  }
}
