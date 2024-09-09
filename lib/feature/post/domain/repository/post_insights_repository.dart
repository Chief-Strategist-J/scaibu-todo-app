abstract class PostInsightsRepository<T> {
  Future<List<T>> getTopPostCategories();

  Future<List<T>> getPostTrends({int days = 30});

  Future<T> getPostEngagementMetrics(int postId);

  Future<T> getPostAuthorStatistics(int authorId);

  Future<List<T>> getPostsWithComments({int page = 1, int pageSize = 20});
}
