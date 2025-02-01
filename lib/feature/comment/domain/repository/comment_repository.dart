/// Doc Required
abstract class CommentRepository<Comment> {
  /// Doc Required
  Future<Comment> getById(final int id) {
    // TO-DO: implement getById
    throw UnimplementedError();
  }

  /// Doc Required
  Future<List<Comment>> getAll({final int page = 1, final int pageSize = 20}) {
    // TO-DO: implement getAll
    throw UnimplementedError();
  }

  /// Doc Required
  Future<bool> create(final Comment entity) {
    // TO-DO: implement create
    throw UnimplementedError();
  }

  /// Doc Required
  Future<bool> update(final int id, final Comment updatedEntity) {
    // TO-DO: implement update
    throw UnimplementedError();
  }

  /// Doc Required
  Future<bool> delete(final int id) {
    // TO-DO: implement delete
    throw UnimplementedError();
  }

  /// Doc Required
  Future<int> count() {
    // TO-DO: implement count
    throw UnimplementedError();
  }

  /// Doc Required
  Future<List<Comment>> getCommentsByPost(
    final int postId, {
    final int page = 1,
    final int pageSize = 20,
  }) {
    // TO-DO: implement getCommentsByPost
    throw UnimplementedError();
  }

  /// Doc Required
  Future<List<Comment>> getCommentsByUser(
    final String userId, {
    final int page = 1,
    final int pageSize = 20,
  }) {
    // TO-DO: implement getCommentsByUser
    throw UnimplementedError();
  }

  /// Doc Required
  Future<bool> createComment(final Comment comment) {
    // TO-DO: implement createComment
    throw UnimplementedError();
  }

  /// Doc Required
  Future<bool> updateCommentMetadata(
    final int commentId,
    final Map<String, dynamic> metadata,
  ) {
    // TO-DO: implement updateCommentMetadata
    throw UnimplementedError();
  }

  /// Doc Required
  Future<bool> flagComment(final int commentId, final String flagReason) {
    // TO-DO: implement flagComment
    throw UnimplementedError();
  }

  /// Doc Required
  Future<List<Comment>> searchComments(
    final String keyword, {
    final int page = 1,
    final int pageSize = 20,
  }) {
    // TO-DO: implement searchComments
    throw UnimplementedError();
  }

  /// Doc Required
  Future<int> getCommentCountByPost(final int postId) {
    // TO-DO: implement getCommentCountByPost
    throw UnimplementedError();
  }

  /// Doc Required
  Future<int> getCommentCountByUser(final String userId) {
    // TO-DO: implement getCommentCountByUser
    throw UnimplementedError();
  }

  /// Doc Required
  Future<List<Comment>> getFlaggedComments({
    final int page = 1,
    final int pageSize = 20,
  }) {
    // TO-DO: implement getFlaggedComments
    throw UnimplementedError();
  }

  /// Doc Required
  Future<bool> approveComment(final int commentId) {
    // TO-DO: implement approveComment
    throw UnimplementedError();
  }

  /// Doc Required
  Future<bool> rejectComment(final int commentId) {
    // TO-DO: implement rejectComment
    throw UnimplementedError();
  }

  /// Doc Required
  Future<List<Comment>> getCommentsByStatus(
    final String status, {
    final int page = 1,
    final int pageSize = 20,
  }) {
    // TO-DO: implement getCommentsByStatus
    throw UnimplementedError();
  }

  /// Doc Required
  Future<bool> updateCommentStatus(
    final int commentId,
    final String newStatus,
  ) {
    // TO-DO: implement updateCommentStatus
    throw UnimplementedError();
  }

  /// Doc Required
  Future<Comment> getMostRecentComment() {
    // TO-DO: implement getMostRecentComment
    throw UnimplementedError();
  }

  /// Doc Required
  Future<List<Comment>> getCommentsByDateRange(
    final DateTime startDate,
    final DateTime endDate, {
    final int page = 1,
    final int pageSize = 20,
  }) {
    // TO-DO: implement getCommentsByDateRange
    throw UnimplementedError();
  }
}
