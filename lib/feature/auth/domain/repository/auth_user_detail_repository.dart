import 'package:todo_app/core/app_library.dart';

abstract interface class AuthUserDetailRepository {
  Future<UserEntity> saveUserData(Map<String, dynamic> userData);

  Future<UserEntity> getUserDetail(String userID);

  Future<UserEntity> updateUserDetail(Map<String, dynamic> userDetail, String userID);

  Future<bool> deleteUserDetail(String userID);
}
