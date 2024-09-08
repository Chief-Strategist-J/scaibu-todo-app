abstract class BasicPostRepository<T> {
  Future<T> createPost(Map<String, dynamic> postData);

  Future<T?> getPostById(int id);

  Future<List<T>> getAllPosts({int page = 1, int pageSize = 20});

  Future<void> updatePost(int id, Map<String, dynamic> updatedData);

  Future<void> deletePost(int id);

  Future<List<T>> searchPosts(String query, {int page = 1, int pageSize = 20});
}
