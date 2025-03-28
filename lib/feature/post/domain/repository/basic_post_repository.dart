/// Doc Required
abstract class BasicPostRepository<T> {
  /// Doc Required
  Future<T> createPost(final Map<String, dynamic> postData);

  /// Doc Required
  Future<T?> getPostById(final int id);

  /// Doc Required
  Future<List<T>> getAllPosts({final int page = 1, final int pageSize = 20});

  /// Doc Required
  Future<void> updatePost(final int id, final Map<String, dynamic> updatedData);

  /// Doc Required
  Future<void> deletePost(final int id);

  /// Doc Required
  Future<List<T>> searchPosts(
    final String query, {
    final int page = 1,
    final int pageSize = 20,
  });
}
