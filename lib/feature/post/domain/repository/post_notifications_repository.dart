/// Doc Required
abstract class PostNotificationsRepository<T> {
  /// Doc Required
  Future<void> notifyPostCreation(final int id);

  /// Doc Required
  Future<void> notifyPostUpdate(final int id);

  /// Doc Required
  Future<void> notifyPostDeletion(final int id);

  /// Doc Required
  Future<void> notifyPostStatusChange(final int id, final String newStatus);

  /// Doc Required
  Future<void> notifyPostComment(final int postId, final int commentId);
}
