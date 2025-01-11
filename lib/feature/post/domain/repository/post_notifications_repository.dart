abstract class PostNotificationsRepository<T> {
  Future<void> notifyPostCreation(final int id);

  Future<void> notifyPostUpdate(final int id);

  Future<void> notifyPostDeletion(final int id);

  Future<void> notifyPostStatusChange(final int id, final String newStatus);

  Future<void> notifyPostComment(final int postId, final int commentId);
}
