abstract class PostTagsRepository<T> {
  Future<void> addTagsToPost(int postId, T tags);

  Future<void> removeTagsFromPost(int postId, T tags);

  Future<T> getTagsForPost(int postId);
}
