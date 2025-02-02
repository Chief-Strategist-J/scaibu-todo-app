import 'package:todo_app/core/app_library.dart';

/// Have implemented yet
class AuthUserDetailRepositoryImpl implements AuthUserDetailRepository {
  @override
  Future<bool> deleteUserDetail(final String userID) {
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> getUserDetail(final String userID) {
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> saveUserData(final Map<String, dynamic> userData) {
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> updateUserDetail(
    final Map<String, dynamic> userDetail,
    final String userID,
  ) {
    throw UnimplementedError();
  }
}
