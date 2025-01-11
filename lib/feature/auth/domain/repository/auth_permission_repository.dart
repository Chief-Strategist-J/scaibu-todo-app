abstract interface class AuthPermissionRepository {
  Future<void> updateUserPermission(
      final Map<String, dynamic> permission, final String userId);

  Future<void> addUserPermission(
      final Map<String, dynamic> permission, final String userId);

  Future<void> getUserPermission(final String userId);

  Future<void> checkUserPermission(final String userId);

  Future<void> removeUserPermission(
      final Map<String, dynamic> permission, final String userId);
}
