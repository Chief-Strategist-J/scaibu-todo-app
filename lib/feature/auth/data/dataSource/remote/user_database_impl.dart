import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/auth/data/model/response/create_otp_response.dart';
import 'package:todo_app/feature/auth/data/model/response/verify_otp_for_forget_password_response.dart';

/// Doc Required
sealed class UserBaseApi {
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

/// Contains the API endpoints related to user authentication.
class UserAuthEndPoint {
  /// Endpoint for logging in or signing up a user.
  static const String loginOrSignUp = 'api/loginOrSignUp';

  /// Endpoint for fetching user details.
  static const String getUserDetail = 'api/getUserDetail';

  /// Endpoint for creating an OTP.
  static const String createOtp = 'api/createOtp';

  /// Endpoint for verifying OTP.
  static const String verifyOtp = 'api/verifyOtp';

  /// Endpoint for initiating password reset process.
  static const String forgetPassword = 'api/forgetPassword';

  /// Endpoint for verifying password reset OTP.
  static const String verifyPasswordOtp = 'api/verifyPasswordOtp';

  /// Endpoint for updating the user's password.
  static const String updatePassword = 'api/updatePassword';

  /// Endpoint for signing out a user.
  static const String signOut = 'api/signOut';
}

/// Implementation of user database interaction, requiring a `RestApi` instance.
class UserDatabaseImpl extends UserBaseApi {
  /// Constructor for initializing the [UserDatabaseImpl] with a [RestApi].
  UserDatabaseImpl({required this.restApi});

  /// The [RestApi] instance used to make API requests.
  final RestApi restApi;

  /// Performs a standard login by making an API
  /// request and returning a [LoginEntity].
  @override
  Future<LoginEntity> standardLogin(
    final Map<String, dynamic> loginCred,
  ) async {
    final LoginResponse res = LoginResponse.fromJson(
      await restApi.request<Response>(
        requestBody: loginCred,
        endPoint: UserAuthEndPoint.loginOrSignUp,
        type: HttpRequestMethod.post,
      ),
    );

    if (res.data == null || res.data?.userInfo == null) {
      return const LoginEntity();
    }

    return LoginEntity(
      name: res.data?.userInfo?.name,
      email: res.data?.userInfo?.email,
      isLogin: res.data?.isLogin,
      isSignUp: res.data?.isSignUp,
      accessToken: res.data?.accessToken,
      id: res.data?.userInfo?.id,
    );
  }

  /// Handles user registration (sign-up)
  /// by making an API request and returning a [LoginEntity].
  @override
  Future<LoginEntity> standardSignUp(
    final Map<String, dynamic> loginCred,
  ) async {
    final LoginResponse res = LoginResponse.fromJson(
      await restApi.request<dynamic>(
        requestBody: loginCred,
        endPoint: UserAuthEndPoint.loginOrSignUp,
        type: HttpRequestMethod.post,
      ),
    );

    if (res.data == null || res.data?.userInfo == null) {
      return const LoginEntity();
    }

    return LoginEntity(
      name: res.data?.userInfo?.name,
      email: res.data?.userInfo?.email,
      isLogin: res.data?.isLogin,
      isSignUp: res.data?.isSignUp,
      accessToken: res.data?.accessToken,
      id: res.data?.userInfo?.id,
    );
  }

  /// Doc Required
  @override
  Future<void> forgetPassword(
    final Map<String, dynamic> forgetPasswordCred,
  ) async {
    await restApi.request<dynamic>(
      requestBody: forgetPasswordCred,
      endPoint: UserAuthEndPoint.forgetPassword,
      type: HttpRequestMethod.post,
    );
  }

  /// Doc Required
  @override
  Future<void> standardLogOut(final Map<String, dynamic> req) async {
    await restApi.request<dynamic>(
      requestBody: req,
      endPoint: UserAuthEndPoint.signOut,
      type: HttpRequestMethod.post,
    );
  }

  /// Doc Required
  @override
  Future<void> updatePassword(
    final Map<String, dynamic> updatePasswordCred,
  ) async {
    await restApi.request<dynamic>(
      requestBody: updatePasswordCred,
      endPoint: UserAuthEndPoint.updatePassword,
      type: HttpRequestMethod.post,
    );
  }

  /// Doc Required
  @override
  Future<bool> verifyOtp(final Map<String, dynamic> verifyOtpCred) async {
    final CreateOtpResponse createTodoResponse = CreateOtpResponse.fromJson(
      await restApi.request<dynamic>(
        requestBody: verifyOtpCred,
        endPoint: UserAuthEndPoint.verifyOtp,
        type: HttpRequestMethod.post,
      ),
    );

    if (createTodoResponse.data == null) {
      return false;
    }

    return createTodoResponse.data!.success.validate();
  }

  /// Doc Required
  @override
  Future<UserEntity> verifyForgetPasswordOtp(
    final Map<String, dynamic> forgetPasswordCred,
  ) async {
    final VerifyOtpForForgetPasswordResponse verify =
        VerifyOtpForForgetPasswordResponse.fromJson(
      await restApi.request<Response>(
        requestBody: forgetPasswordCred,
        endPoint: UserAuthEndPoint.verifyPasswordOtp,
        type: HttpRequestMethod.post,
      ),
    );
    if (verify.data == null) {
      return const UserEntity();
    }

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

  /// Doc Required
  @override
  Future<bool> createOpt(final Map<String, dynamic> otpCred) async {
    final CreateOtpResponse createTodoResponse = CreateOtpResponse.fromJson(
      await restApi.request<dynamic>(
        requestBody: otpCred,
        endPoint: UserAuthEndPoint.createOtp,
        type: HttpRequestMethod.post,
      ),
    );

    if (createTodoResponse.data == null) {
      return false;
    }

    return createTodoResponse.data!.success.validate();
  }

  /// Doc Required
  @override
  Future<Either<FailResponse, LoginEntity>> getUserDetail(
    final Map<String, dynamic> loginCred,
  ) async {
    try {
      final Map<String, dynamic> response = await restApi.request<dynamic>(
        requestBody: loginCred,
        endPoint: UserAuthEndPoint.getUserDetail,
        type: HttpRequestMethod.post,
      ) as Map<String, dynamic>;

      if (response['status'] != true) {
        return Left<FailResponse, LoginEntity>(FailResponse.fromJson(response));
      }

      final LoginResponse res = LoginResponse.fromJson(response);
      final UserInfo? userInfo = res.data?.userInfo;
      final LoginEntity loginEntity = LoginEntity(
        name: userInfo?.name,
        email: userInfo?.email,
        isLogin: res.data?.isLogin,
        isSignUp: res.data?.isSignUp,
        accessToken: res.data?.accessToken,
        id: userInfo?.id,
      );

      return Right<FailResponse, LoginEntity>(loginEntity);
    } catch (e) {
      return Left<FailResponse, LoginEntity>(
        FailResponse(status: false, message: 'Error: ${e.toString()}'),
      );
    }
  }
}
