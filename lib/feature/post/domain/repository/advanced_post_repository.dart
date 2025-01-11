abstract class AdvancedPostRepository<T> {
  Future<List<T>> getPostsByCriteria(final Map<String, dynamic> criteria,
      {final int page = 1, final int pageSize = 20});

  Future<List<T>> filterPosts(final Map<String, dynamic> filters,
      {final int page = 1, final int pageSize = 20});

  Future<int> countPostsByCriteria(final Map<String, dynamic> criteria);

  Future<List<T>> getFeaturedPosts(
      {final int page = 1, final int pageSize = 20});

  Future<List<T>> getRecentPosts({final int page = 1, final int pageSize = 20});

  Future<List<T>> getPostsByAuthor(final int authorId,
      {final int page = 1, final int pageSize = 20});

  Future<List<T>> getPostsByTags(final List<String> tags,
      {final int page = 1, final int pageSize = 20});

  Future<List<T>> getPopularPosts(
      {final int page = 1, final int pageSize = 20});
}
