abstract class CommentRepository<Comment, CommentMetadata> {
  Future<Comment> getById(int id);

  Future<List<Comment>> getAll({int page = 1, int pageSize = 20});

  Future<bool> create(Comment entity);

  Future<bool> update(int id, Comment updatedEntity);

  Future<bool> delete(int id);

  Future<int> count();

  Future<List<Comment>> getCommentsByPost(int postId, {int page = 1, int pageSize = 20});

  Future<List<Comment>> getCommentsByUser(String userId, {int page = 1, int pageSize = 20});

  Future<bool> createComment(Comment comment);

  Future<bool> updateCommentMetadata(int commentId, CommentMetadata metadata);

  Future<bool> flagComment(int commentId, String flagReason);

  Future<List<Comment>> searchComments(String keyword, {int page = 1, int pageSize = 20});

  Future<int> getCommentCountByPost(int postId);

  Future<int> getCommentCountByUser(String userId);

  Future<List<Comment>> getFlaggedComments({int page = 1, int pageSize = 20});

  Future<bool> approveComment(int commentId);

  Future<bool> rejectComment(int commentId);

  Future<List<Comment>> getCommentsByStatus(String status, {int page = 1, int pageSize = 20});

  Future<bool> updateCommentStatus(int commentId, String newStatus);

  Future<Comment> getMostRecentComment();

  Future<List<Comment>> getCommentsByDateRange(DateTime startDate, DateTime endDate, {int page = 1, int pageSize = 20});
}
