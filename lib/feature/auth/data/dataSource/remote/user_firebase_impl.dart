import 'package:todo_app/core/app_library.dart';

class UserFirebaseImpl implements UserBaseApi {
  @override
  Future<void> forgetPassword(Map<String, dynamic> forgetPasswordCred) {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> getUserDetail(String userID) {
    // TODO: implement getUserDetail
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> registerUser(Map<String, dynamic> userData) {
    throw UnimplementedError();
  }

  @override
  Future<void> standardLogOut(String userID) {
    // TODO: implement standardLogOut
    throw UnimplementedError();
  }

  @override
  Future<LoginEntity> standardLogin(Map<String, dynamic> loginCred) {
    // TODO: implement standardLogin
    throw UnimplementedError();
  }

  @override
  Future<void> updatePassword(Map<String, dynamic> updatePasswordCred) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> updateUserDetail(Map<String, dynamic> userDetail, String userID) {
    // TODO: implement updateUserDetail
    throw UnimplementedError();
  }

  @override
  Future<bool> verifyOtp(String otp) {
    // TODO: implement verifyOtp
    throw UnimplementedError();
  }

  @override
  Future<void> verifyForgetPasswordOtp(Map<String, dynamic> forgetPasswordCred) {
    // TODO: implement verifyForgetPasswordOtp
    throw UnimplementedError();
  }

  @override
  Future<LoginEntity> standardSignUp(Map<String, dynamic> loginCred) {
    throw UnimplementedError();
  }
}
