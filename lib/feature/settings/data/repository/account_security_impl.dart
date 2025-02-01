import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/settings/domain/repositories/account_security_repository.dart';

/// Doc Required
class AccountSecurityImpl extends AccountSecurityRepository<dynamic> {
  /// Doc Required
  @override
  Future<void> changeAccountPassword(
    final String userId,
    final String newPassword,
  ) {
    // TO-DO: implement changeAccountPassword
    throw UnimplementedError();
  }

  /// Doc Required

  @override
  Future<void> getAccountSecuritySettings(final String userId) {
    // TO-DO: implement getAccountSecuritySettings
    throw UnimplementedError();
  }

  /// Doc Required

  @override
  Future<void> setTwoFactorAuthentication(
    final String userId, {
    required final bool enabled,
  }) {
    // TO-DO: implement setTwoFactorAuthentication
    throw UnimplementedError();
  }

  /// Doc Required

  @override
  Future<void> updateAccountSecuritySettings(
    final String userId,
    final Map<String, dynamic> securitySettings,
  ) {
    // TO-DO: implement updateAccountSecuritySettings
    throw UnimplementedError();
  }
}
