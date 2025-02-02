/// Doc Required
abstract interface class AuthPermissionRepository {
  /// Doc Required
  Future<void> updateUserPermission(
    final Map<String, dynamic> permission,
    final String userId,
  );

  /// Doc Required
  Future<void> addUserPermission(
    final Map<String, dynamic> permission,
    final String userId,
  );

  /// Doc Required
  Future<void> getUserPermission(final String userId);

  /// Doc Required
  Future<void> checkUserPermission(final String userId);

  /// Doc Required
  Future<void> removeUserPermission(
    final Map<String, dynamic> permission,
    final String userId,
  );
}
