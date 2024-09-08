abstract class PostInsightsRepository<T, Category, Trend, EngagementMetrics, AuthorStatistics, PostWithComments> {
  Future<List<Category>> getTopPostCategories();

  Future<List<Trend>> getPostTrends({int days = 30});

  Future<EngagementMetrics> getPostEngagementMetrics(int postId);

  Future<AuthorStatistics> getPostAuthorStatistics(int authorId);

  Future<List<PostWithComments>> getPostsWithComments({int page = 1, int pageSize = 20});
}
