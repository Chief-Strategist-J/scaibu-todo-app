abstract class PostReactionsRepository<T> {
  Future<void> addReaction(int postId, String reactionType);

  Future<void> removeReaction(int postId, String reactionType);

  Future<T> getReactionsCount(int postId);
}
