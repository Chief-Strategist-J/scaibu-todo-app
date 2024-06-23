

import 'package:todo_app/core/app_library.dart';

class AuthRepositoryImpl implements AuthRepository {
  final UserBaseApi baseApi;

  AuthRepositoryImpl({required this.baseApi});

  @override
  Future<void> forgetPassword(Map<String, dynamic> forgetPasswordCred) {
    return baseApi.forgetPassword(forgetPasswordCred);
  }

  @override
  Future<UserEntity> getUserDetail(String userID) {
    return baseApi.getUserDetail(userID);
  }

  @override
  Future<UserEntity> registerUser(Map<String, dynamic> userData) {
    return baseApi.registerUser(userData);
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
  Future<UserEntity> updateUserDetail(Map<String, dynamic> userDetail, String userID) {
    return baseApi.updateUserDetail(userDetail, userID);
  }

  @override
  Future<bool> verifyOtp(String otp) {
    return baseApi.verifyOtp(otp);
  }

  @override
  Future<void> verifyForgetPasswordOtp(Map<String, dynamic> forgetPasswordCred) {
    return baseApi.verifyForgetPasswordOtp(forgetPasswordCred);
  }

  @override
  Future<LoginEntity> standardSignUp(Map<String, dynamic> loginCred) {
    throw UnimplementedError();
  }
}
