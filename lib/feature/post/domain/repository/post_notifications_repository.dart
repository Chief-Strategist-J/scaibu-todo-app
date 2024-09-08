abstract class PostNotificationsRepository<T> {
  Future<void> notifyPostCreation(int id);

  Future<void> notifyPostUpdate(int id);

  Future<void> notifyPostDeletion(int id);

  Future<void> notifyPostStatusChange(int id, String newStatus);

  Future<void> notifyPostComment(int postId, int commentId);
}
