import 'package:todo_app/core/app_library.dart';

class AuthUserDetailRepositoryImpl implements AuthUserDetailRepository {
  @override
  Future<bool> deleteUserDetail(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> getUserDetail(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> saveUserData(Map<String, dynamic> userData) {
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> updateUserDetail(Map<String, dynamic> userDetail, String userID) {
    throw UnimplementedError();
  }
}
