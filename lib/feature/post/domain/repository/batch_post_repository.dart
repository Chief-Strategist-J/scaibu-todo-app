/// Doc Required
abstract class BatchPostRepository<T> {
  /// Doc Required
  Future<void> batchCreatePosts(final List<Map<String, dynamic>> postsData);

  /// Doc Required
  Future<void> batchUpdatePosts(final Map<int, Map<String, dynamic>> updates);

  /// Doc Required
  Future<void> batchDeletePosts(final List<int> ids);
}
