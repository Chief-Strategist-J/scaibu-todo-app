abstract class BatchPostRepository<T> {
  Future<void> batchCreatePosts(final List<Map<String, dynamic>> postsData);

  Future<void> batchUpdatePosts(final Map<int, Map<String, dynamic>> updates);

  Future<void> batchDeletePosts(final List<int> ids);
}
