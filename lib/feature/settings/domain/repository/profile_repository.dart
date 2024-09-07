abstract class ProfileRepository<T> {
  // Get user profile
  Future<T> getUserProfile(String userId);

  // Update user profile
  Future<void> updateUserProfile(String userId, Map<String, dynamic> profileData);

  // Delete user profile
  Future<void> deleteUserProfile(String userId);
}
