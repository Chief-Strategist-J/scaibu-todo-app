abstract class CommentRepository<Comment> {
  Future<Comment> getById(final int id);

  Future<List<Comment>> getAll({final int page = 1, final int pageSize = 20});

  Future<bool> create(final Comment entity);

  Future<bool> update(final int id, final Comment updatedEntity);

  Future<bool> delete(final int id);

  Future<int> count();

  Future<List<Comment>> getCommentsByPost(
    final int postId, {
    final int page = 1,
    final int pageSize = 20,
  });

  Future<List<Comment>> getCommentsByUser(
    final String userId, {
    final int page = 1,
    final int pageSize = 20,
  });

  Future<bool> createComment(final Comment comment);

  Future<bool> updateCommentMetadata(
    final int commentId,
    final Map<String, dynamic> metadata,
  );

  Future<bool> flagComment(final int commentId, final String flagReason);

  Future<List<Comment>> searchComments(
    final String keyword, {
    final int page = 1,
    final int pageSize = 20,
  });

  Future<int> getCommentCountByPost(final int postId);

  Future<int> getCommentCountByUser(final String userId);

  Future<List<Comment>> getFlaggedComments({
    final int page = 1,
    final int pageSize = 20,
  });

  Future<bool> approveComment(final int commentId);

  Future<bool> rejectComment(final int commentId);

  Future<List<Comment>> getCommentsByStatus(
    final String status, {
    final int page = 1,
    final int pageSize = 20,
  });

  Future<bool> updateCommentStatus(final int commentId, final String newStatus);

  Future<Comment> getMostRecentComment();

  Future<List<Comment>> getCommentsByDateRange(
    final DateTime startDate,
    final DateTime endDate, {
    final int page = 1,
    final int pageSize = 20,
  });
}
