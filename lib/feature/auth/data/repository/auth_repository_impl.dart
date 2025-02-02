import 'package:todo_app/core/app_library.dart';

/// Standard Auth API
class AuthRepositoryImpl implements AuthRepository {
  /// Standard Auth API Constructor
  AuthRepositoryImpl({required final UserBaseApi baseApi}) : _baseApi = baseApi;

  final UserBaseApi _baseApi;

  @override
  Future<void> forgetPassword(final Map<String, dynamic> forgetPasswordCred) =>
      _baseApi.forgetPassword(forgetPasswordCred);

  @override
  Future<void> standardLogOut(final Map<String, dynamic> req) =>
      _baseApi.standardLogOut(req);

  @override
  Future<LoginEntity> standardSignIn(final Map<String, dynamic> loginCred) =>
      _baseApi.standardLogin(loginCred);

  @override
  Future<void> updatePassword(final Map<String, dynamic> updatePasswordCred) =>
      _baseApi.updatePassword(updatePasswordCred);

  @override
  Future<bool> verifyOtp(final Map<String, dynamic> verifyOtpCred) =>
      _baseApi.verifyOtp(verifyOtpCred);

  @override
  Future<UserEntity> verifyForgetPasswordOtp(
    final Map<String, dynamic> forgetPasswordCred,
  ) =>
      _baseApi.verifyForgetPasswordOtp(forgetPasswordCred);

  @override
  Future<LoginEntity> standardSignUp(final Map<String, dynamic> loginCred) {
    throw UnimplementedError();
  }

  @override
  Future<bool> createOpt(final Map<String, dynamic> otpCred) {
    /// Implement later
    throw UnimplementedError();
  }

  @override
  Future<Either<FailResponse, LoginEntity>> getUserDetail(
    final Map<String, dynamic> loginCred,
  ) async =>
      _baseApi.getUserDetail(loginCred);
}
