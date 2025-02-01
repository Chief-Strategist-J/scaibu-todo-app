/// Doc Required
abstract class ProfileRepository<T> {
  /// Get user profile
  Future<T> getUserProfile(final String userId);

  /// Update user profile
  Future<void> updateUserProfile(
    final String userId,
    final Map<String, dynamic> profileData,
  );

  /// Delete user profile
  Future<void> deleteUserProfile(final String userId);
}
