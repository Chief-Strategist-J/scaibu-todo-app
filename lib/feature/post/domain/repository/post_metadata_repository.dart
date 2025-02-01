/// Doc Required
abstract class PostMetadataRepository<T> {
  /// Doc Required
  Future<void> updatePostMetadata(final int id,
      final Map<String, dynamic> metadata,);

  /// Doc Required
  Future<T> getPostMetadata(final int id);

  /// Doc Required
  Future<List<T>> getPostsByMetadata(final String key, final String value, {
    final int page = 1,
    final int pageSize = 20,
  });

  /// Doc Required
  Future<void> batchUpdatePostMetadata(
    final Map<String, dynamic> metadataUpdates,
  );
}
