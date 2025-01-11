abstract class PostTagsRepository<T> {
  Future<void> addTagsToPost(final int postId, final T tags);

  Future<void> removeTagsFromPost(final int postId, final T tags);

  Future<T> getTagsForPost(final int postId);
}
