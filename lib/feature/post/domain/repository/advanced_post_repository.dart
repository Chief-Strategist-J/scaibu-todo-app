abstract class AdvancedPostRepository<T> {
  Future<List<T>> getPostsByCriteria(Map<String, dynamic> criteria, {int page = 1, int pageSize = 20});

  Future<List<T>> filterPosts(Map<String, dynamic> filters, {int page = 1, int pageSize = 20});

  Future<int> countPostsByCriteria(Map<String, dynamic> criteria);

  Future<List<T>> getFeaturedPosts({int page = 1, int pageSize = 20});

  Future<List<T>> getRecentPosts({int page = 1, int pageSize = 20});

  Future<List<T>> getPostsByAuthor(int authorId, {int page = 1, int pageSize = 20});

  Future<List<T>> getPostsByTags(List<String> tags, {int page = 1, int pageSize = 20});

  Future<List<T>> getPopularPosts({int page = 1, int pageSize = 20});
}
