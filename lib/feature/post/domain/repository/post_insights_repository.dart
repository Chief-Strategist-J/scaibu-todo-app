/// Doc Required
abstract class PostInsightsRepository<T> {
  /// Doc Required
  Future<List<T>> getTopPostCategories();

  /// Doc Required
  Future<List<T>> getPostTrends({final int days = 30});

  /// Doc Required
  Future<T> getPostEngagementMetrics(final int postId);

  /// Doc Required
  Future<T> getPostAuthorStatistics(final int authorId);

  /// Doc Required
  Future<List<T>> getPostsWithComments({
    final int page = 1,
    final int pageSize = 20,
  });
}
