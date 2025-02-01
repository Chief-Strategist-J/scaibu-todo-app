/// Doc Required
abstract class AdvancedPostRepository<T> {
  /// Doc Required
  Future<List<T>> getPostsByCriteria(
    final Map<String, dynamic> criteria, {
    final int page = 1,
    final int pageSize = 20,
  });

  /// Doc Required
  Future<List<T>> filterPosts(
    final Map<String, dynamic> filters, {
    final int page = 1,
    final int pageSize = 20,
  });

  /// Doc Required
  Future<int> countPostsByCriteria(final Map<String, dynamic> criteria);

  /// Doc Required
  Future<List<T>> getFeaturedPosts({
    final int page = 1,
    final int pageSize = 20,
  });

  /// Doc Required
  Future<List<T>> getRecentPosts({final int page = 1, final int pageSize = 20});

  /// Doc Required
  Future<List<T>> getPostsByAuthor(
    final int authorId, {
    final int page = 1,
    final int pageSize = 20,
  });

  /// Doc Required
  Future<List<T>> getPostsByTags(
    final List<String> tags, {
    final int page = 1,
    final int pageSize = 20,
  });

  /// Doc Required
  Future<List<T>> getPopularPosts({
    final int page = 1,
    final int pageSize = 20,
  });
}
