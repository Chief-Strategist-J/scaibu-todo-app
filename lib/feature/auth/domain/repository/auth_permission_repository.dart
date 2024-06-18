abstract interface class AuthPermissionRepository {
  Future<void> updateUserPermission(Map<String, dynamic> permission, String userId);

  Future<void> addUserPermission(Map<String, dynamic> permission, String userId);

  Future<void> getUserPermission(String userId);

  Future<void> checkUserPermission(String userId);

  Future<void> removeUserPermission(Map<String, dynamic> permission, String userId);
}
