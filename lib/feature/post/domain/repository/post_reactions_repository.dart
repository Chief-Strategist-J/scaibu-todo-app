abstract class PostReactionsRepository<T> {
  Future<void> addReaction(final int postId, final String reactionType);

  Future<void> removeReaction(final int postId, final String reactionType);

  Future<T> getReactionsCount(final int postId);
}
