abstract class BasicPostRepository<T> {
  Future<T> createPost(final Map<String, dynamic> postData);

  Future<T?> getPostById(final int id);

  Future<List<T>> getAllPosts({final int page = 1, final int pageSize = 20});

  Future<void> updatePost(final int id, final Map<String, dynamic> updatedData);

  Future<void> deletePost(final int id);

  Future<List<T>> searchPosts(final String query,
      {final int page = 1, final int pageSize = 20});
}
