import 'package:todo_app/core/app_library.dart';

/// Standard Auth API
class AuthRepositoryImpl implements AuthRepository {
  /// Standard Auth API Constructor
  AuthRepositoryImpl({required UserBaseApi baseApi}) : _baseApi = baseApi;

  final UserBaseApi _baseApi;

  @override
  Future<void> forgetPassword(Map<String, dynamic> forgetPasswordCred) =>
      _baseApi.forgetPassword(forgetPasswordCred);

  @override
  Future<void> standardLogOut(Map<String, dynamic> req) =>
      _baseApi.standardLogOut(req);

  @override
  Future<LoginEntity> standardSignIn(Map<String, dynamic> loginCred) =>
      _baseApi.standardLogin(loginCred);

  @override
  Future<void> updatePassword(Map<String, dynamic> updatePasswordCred) =>
      _baseApi.updatePassword(updatePasswordCred);

  @override
  Future<bool> verifyOtp(Map<String, dynamic> verifyOtpCred) =>
      _baseApi.verifyOtp(verifyOtpCred);

  @override
  Future<UserEntity> verifyForgetPasswordOtp(
          Map<String, dynamic> forgetPasswordCred) =>
      _baseApi.verifyForgetPasswordOtp(forgetPasswordCred);

  @override
  Future<LoginEntity> standardSignUp(Map<String, dynamic> loginCred) {
    throw UnimplementedError();
  }

  @override
  Future<bool> createOpt(Map<String, dynamic> otpCred) {
    // TODO: implement createOpt
    throw UnimplementedError();
  }

  @override
  Future<Either<FailResponse, LoginEntity>> getUserDetail(
    Map<String, dynamic> loginCred,
  ) async =>
      _baseApi.getUserDetail(loginCred);
}
