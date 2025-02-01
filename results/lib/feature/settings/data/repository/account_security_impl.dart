import 'package:todo_app/core/app_library.dart';

class AccountSecurityImpl extends AccountSecurityRepository {
  @override
  Future<void> changeAccountPassword(String userId, String newPassword) {
    // TODO: implement changeAccountPassword
    throw UnimplementedError();
  }

  @override
  Future getAccountSecuritySettings(String userId) {
    // TODO: implement getAccountSecuritySettings
    throw UnimplementedError();
  }

  @override
  Future<void> setTwoFactorAuthentication(String userId, bool enabled) {
    // TODO: implement setTwoFactorAuthentication
    throw UnimplementedError();
  }

  @override
  Future<void> updateAccountSecuritySettings(String userId, Map<String, dynamic> securitySettings) {
    // TODO: implement updateAccountSecuritySettings
    throw UnimplementedError();
  }
}
