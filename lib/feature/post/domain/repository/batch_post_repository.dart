abstract class BatchPostRepository<T> {
  Future<void> batchCreatePosts(List<Map<String, dynamic>> postsData);

  Future<void> batchUpdatePosts(Map<int, Map<String, dynamic>> updates);

  Future<void> batchDeletePosts(List<int> ids);
}
