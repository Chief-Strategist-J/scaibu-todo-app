abstract class PostInsightsRepository<T> {
  Future<List<T>> getTopPostCategories();

  Future<List<T>> getPostTrends({final int days = 30});

  Future<T> getPostEngagementMetrics(final int postId);

  Future<T> getPostAuthorStatistics(final int authorId);

  Future<List<T>> getPostsWithComments(
      {final int page = 1, final int pageSize = 20});
}
