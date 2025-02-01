/// Doc Required
abstract class PostTagsRepository<T> {
  /// Doc Required
  Future<void> addTagsToPost(final int postId, final T tags);

  /// Doc Required
  Future<void> removeTagsFromPost(final int postId, final T tags);

  /// Doc Required
  Future<T> getTagsForPost(final int postId);
}
