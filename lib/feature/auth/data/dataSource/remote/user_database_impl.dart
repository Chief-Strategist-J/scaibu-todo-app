import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/auth/data/model/response/create_otp_response.dart';
import 'package:todo_app/feature/auth/data/model/response/verify_otp_for_forget_password_response.dart';

class UserAuthEndPoint {
  static const loginOrSignUp = "api/loginOrSignUp";
  static const getUserDetail = "api/getUserDetail";
  static const createOtp = "api/createOtp";
  static const verifyOtp = "api/verifyOtp";
  static const forgetPassword = "api/forgetPassword";
  static const verifyPasswordOtp = "api/verifyPasswordOtp";
  static const updatePassword = 'api/updatePassword';
  static const signOut = 'api/signOut';
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
        type: HttpRequestMethod.post,
      ),
    );

    if (res.data == null || res.data?.userInfo == null) return const LoginEntity();

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
        type: HttpRequestMethod.post,
      ),
    );

    if (res.data == null || res.data?.userInfo == null) return const LoginEntity();

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
  Future<void> forgetPassword(Map<String, dynamic> forgetPasswordCred) async {
    await restApi.request(
      requestBody: forgetPasswordCred,
      endPoint: UserAuthEndPoint.forgetPassword,
      type: HttpRequestMethod.post,
    );
  }

  @override
  Future<void> standardLogOut(Map<String,dynamic> req) async {
    await restApi.request(
      requestBody: req,
      endPoint: UserAuthEndPoint.signOut,
      type: HttpRequestMethod.post,
    );
  }

  @override
  Future<void> updatePassword(Map<String, dynamic> updatePasswordCred) async {
    await restApi.request(
      requestBody: updatePasswordCred,
      endPoint: UserAuthEndPoint.updatePassword,
      type: HttpRequestMethod.post,
    );
  }

  @override
  Future<bool> verifyOtp(Map<String, dynamic> verifyOtpCred) async {
    CreateOtpResponse createTodoResponse = CreateOtpResponse.fromJson(
      await restApi.request(
        requestBody: verifyOtpCred,
        endPoint: UserAuthEndPoint.verifyOtp,
        type: HttpRequestMethod.post,
      ),
    );

    if (createTodoResponse.data == null) return false;

    return createTodoResponse.data!.success.validate();
  }

  @override
  Future<UserEntity> verifyForgetPasswordOtp(Map<String, dynamic> forgetPasswordCred) async {
    final verify = VerifyOtpForForgetPasswordResponse.fromJson(
      await restApi.request(
        requestBody: forgetPasswordCred,
        endPoint: UserAuthEndPoint.verifyPasswordOtp,
        type: HttpRequestMethod.post,
      ),
    );
    if (verify.data == null) return const UserEntity();

    return UserEntity(
      id: verify.data?.id,
      email: verify.data?.email,
      address: verify.data?.address,
      avatar: verify.data?.avatar,
      bio: verify.data?.bio,
      birthdate: verify.data?.birthdate,
      city: verify.data?.city,
      country: verify.data?.country,
      firebaseUserDetailsId: verify.data?.firebaseUserDetailsId,
      firstName: verify.data?.firstName,
      lastName: verify.data?.lastName,
      phone: verify.data?.phone,
      state: verify.data?.state,
      userId: verify.data?.userId,
      zipcode: verify.data?.zipcode,
    );
  }

  @override
  Future<bool> createOpt(Map<String, dynamic> otpCred) async {
    CreateOtpResponse createTodoResponse = CreateOtpResponse.fromJson(
      await restApi.request(
        requestBody: otpCred,
        endPoint: UserAuthEndPoint.createOtp,
        type: HttpRequestMethod.post,
      ),
    );

    if (createTodoResponse.data == null) return false;

    return createTodoResponse.data!.success.validate();
  }

  @override
  Future<Either<FailResponse, LoginEntity>> getUserDetail(Map<String, dynamic> loginCred) async {
    try {
      final response = await restApi.request(
        requestBody: loginCred,
        endPoint: UserAuthEndPoint.getUserDetail,
        type: HttpRequestMethod.post,
      );

      if (response['status'] != true) return Left(FailResponse.fromJson(response));

      final res = LoginResponse.fromJson(response);
      final userInfo = res.data?.userInfo;
      final loginEntity = LoginEntity(
        name: userInfo?.name,
        email: userInfo?.email,
        isLogin: res.data?.isLogin,
        isSignUp: res.data?.isSignUp,
        accessToken: res.data?.accessToken,
        id: userInfo?.id,
      );

      return Right(loginEntity);
    } catch (e) {
      return Left(FailResponse(status: false, message: 'Error: ${e.toString()}'));
    }
  }
}
