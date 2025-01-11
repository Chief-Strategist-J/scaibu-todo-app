abstract class PostMetadataRepository<T> {
  Future<void> updatePostMetadata(
      final int id, final Map<String, dynamic> metadata);

  Future<T> getPostMetadata(final int id);

  Future<List<T>> getPostsByMetadata(final String key, final String value,
      {final int page = 1, final int pageSize = 20});

  Future<void> batchUpdatePostMetadata(
      final Map<String, dynamic> metadataUpdates);
}
