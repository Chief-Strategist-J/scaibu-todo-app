import 'package:todo_app/feature/comment/domain/repository/comment_repository.dart';

/// Doc Required
class Comment extends Object {}

/// Doc Required
class CommentImpl extends CommentRepository<CommentRepository<Comment>> {
  @override
  Future<bool> approveComment(final int commentId) {
    // TO-DO: implement approveComment
    throw UnimplementedError();
  }

  @override
  Future<int> count() {
    // TO-DO: implement count
    throw UnimplementedError();
  }

  @override
  Future<bool> create(final CommentRepository<Comment> entity) {
    // TO-DO: implement create
    throw UnimplementedError();
  }

  @override
  Future<bool> createComment(final CommentRepository<Comment> comment) {
    // TO-DO: implement createComment
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(final int id) {
    // TO-DO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<bool> flagComment(final int commentId, final String flagReason) {
    // TO-DO: implement flagComment
    throw UnimplementedError();
  }

  @override
  Future<List<CommentRepository<Comment>>> getAll({
    final int page = 1,
    final int pageSize = 20,
  }) {
    // TO-DO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<CommentRepository<Comment>> getById(final int id) {
    // TO-DO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<int> getCommentCountByPost(final int postId) {
    // TO-DO: implement getCommentCountByPost
    throw UnimplementedError();
  }

  @override
  Future<int> getCommentCountByUser(final String userId) {
    // TO-DO: implement getCommentCountByUser
    throw UnimplementedError();
  }

  @override
  Future<List<CommentRepository<Comment>>> getCommentsByDateRange(
    final DateTime startDate,
    final DateTime endDate, {
    final int page = 1,
    final int pageSize = 20,
  }) {
    // TO-DO: implement getCommentsByDateRange
    throw UnimplementedError();
  }

  @override
  Future<List<CommentRepository<Comment>>> getCommentsByPost(
    final int postId, {
    final int page = 1,
    final int pageSize = 20,
  }) {
    // TO-DO: implement getCommentsByPost
    throw UnimplementedError();
  }

  @override
  Future<List<CommentRepository<Comment>>> getCommentsByStatus(
    final String status, {
    final int page = 1,
    final int pageSize = 20,
  }) {
    // TO-DO: implement getCommentsByStatus
    throw UnimplementedError();
  }

  @override
  Future<List<CommentRepository<Comment>>> getCommentsByUser(
    final String userId, {
    final int page = 1,
    final int pageSize = 20,
  }) {
    // TO-DO: implement getCommentsByUser
    throw UnimplementedError();
  }

  @override
  Future<List<CommentRepository<Comment>>> getFlaggedComments({
    final int page = 1,
    final int pageSize = 20,
  }) {
    // TO-DO: implement getFlaggedComments
    throw UnimplementedError();
  }

  @override
  Future<CommentRepository<Comment>> getMostRecentComment() {
    // TO-DO: implement getMostRecentComment
    throw UnimplementedError();
  }

  @override
  Future<bool> rejectComment(final int commentId) {
    // TO-DO: implement rejectComment
    throw UnimplementedError();
  }

  @override
  Future<List<CommentRepository<Comment>>> searchComments(
    final String keyword, {
    final int page = 1,
    final int pageSize = 20,
  }) {
    // TO-DO: implement searchComments
    throw UnimplementedError();
  }

  @override
  Future<bool> update(
    final int id,
    final CommentRepository<Comment> updatedEntity,
  ) {
    // TO-DO: implement update
    throw UnimplementedError();
  }

  @override
  Future<bool> updateCommentMetadata(
    final int commentId,
    final Map<String, dynamic> metadata,
  ) {
    // TO-DO: implement updateCommentMetadata
    throw UnimplementedError();
  }

  @override
  Future<bool> updateCommentStatus(
    final int commentId,
    final String newStatus,
  ) {
    // TO-DO: implement updateCommentStatus
    throw UnimplementedError();
  }
}
