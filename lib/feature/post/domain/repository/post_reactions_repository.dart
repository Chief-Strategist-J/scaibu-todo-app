/// Doc Required
abstract class PostReactionsRepository<T> {
  /// Doc Required
  Future<void> addReaction(final int postId, final String reactionType);

  /// Doc Required
  Future<void> removeReaction(final int postId, final String reactionType);

  /// Doc Required
  Future<T> getReactionsCount(final int postId);
}
