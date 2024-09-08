abstract class PostMetadataRepository<T> {
  Future<void> updatePostMetadata(int id, Map<String, dynamic> metadata);

  Future<Map<String, dynamic>> getPostMetadata(int id);

  Future<List<T>> getPostsByMetadata(String key, String value, {int page = 1, int pageSize = 20});

  Future<void> batchUpdatePostMetadata(Map<int, Map<String, dynamic>> metadataUpdates);
}
