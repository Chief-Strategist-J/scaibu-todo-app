

import 'package:todo_app/core/app_library.dart';

class UserAuthEndPoint {
  static const loginOrSignUp = "api/loginOrSignUp";
  static const createOtp = "api/createOtp";
  static const verifyOtp = "api/verifyOtp";
  static const updateUserDetails = "api/updateUserDetails";
  static const getUserDetail = "api/getUserDetail";
  static const forgetPassword = "api/forgetPassword";
  static const verifyPasswordOtp = "api/verifyPasswordOtp";
  static const updatePassword = 'api/updatePassword';
}

class UserDatabaseImpl implements UserBaseApi {
  final RestApi restApi;

  UserDatabaseImpl({required this.restApi});

  @override
  Future<LoginEntity> standardLogin(Map<String, dynamic> loginCred) async {
    LoginResponse res = LoginResponse.fromJson(
      await restApi.request(
        requestBody: loginCred,
        endPoint: UserAuthEndPoint.loginOrSignUp,
        requestAPIName: UserAuthEndPoint.loginOrSignUp,
      ),
    );

    if (res.data == null || res.data?.userInfo == null) return LoginEntity();

    return LoginEntity(
      name: res.data?.userInfo?.name,
      email: res.data?.userInfo?.email,
      isLogin: res.data?.isLogin,
      isSignUp: res.data?.isSignUp,
      accessToken: res.data?.accessToken,
      id: res.data?.userInfo?.id,
    );
  }

  @override
  Future<LoginEntity> standardSignUp(Map<String, dynamic> loginCred) async {
    LoginResponse res = LoginResponse.fromJson(
      await restApi.request(
        requestBody: loginCred,
        endPoint: UserAuthEndPoint.loginOrSignUp,
        requestAPIName: UserAuthEndPoint.loginOrSignUp,
      ),
    );

    if (res.data == null || res.data?.userInfo == null) return LoginEntity();

    return LoginEntity(
      name: res.data?.userInfo?.name,
      email: res.data?.userInfo?.email,
      isLogin: res.data?.isLogin,
      isSignUp: res.data?.isSignUp,
      accessToken: res.data?.accessToken,
      id: res.data?.userInfo?.id,
    );
  }

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
    // TODO: implement registerUser
    throw UnimplementedError();
  }

  @override
  Future<void> standardLogOut(String userID) {
    // TODO: implement standardLogOut
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
}
