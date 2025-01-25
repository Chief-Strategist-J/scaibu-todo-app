import 'package:todo_app/core/app_library.dart';

abstract interface class AuthUserDetailBaseApi {
  Future<UserEntity> saveUserData(final Map<String, dynamic> userData);

  Future<UserEntity> getUserDetail(final String userID);

  Future<UserEntity> updateUserDetail(
    final Map<String, dynamic> userDetail,
    final String userID,
  );

  Future<bool> deleteUserDetail(final String userID);
}
