import 'package:todo_app/core/app_library.dart';

/// Doc Required
abstract interface class AuthUserDetailBaseApi {
  /// Doc Required
  Future<UserEntity> saveUserData(final Map<String, dynamic> userData);

  /// Doc Required
  Future<UserEntity> getUserDetail(final String userID);

  /// Doc Required
  Future<UserEntity> updateUserDetail(
    final Map<String, dynamic> userDetail,
    final String userID,
  );

  /// Doc Required
  Future<bool> deleteUserDetail(final String userID);
}
