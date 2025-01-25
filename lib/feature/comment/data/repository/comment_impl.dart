import 'package:todo_app/feature/comment/domain/repository/comment_repository.dart';

class CommentImpl extends CommentRepository<CommentRepository> {
  @override
  Future<bool> approveComment(final int commentId) {
    // TODO: implement approveComment
    throw UnimplementedError();
  }

  @override
  Future<int> count() {
    // TODO: implement count
    throw UnimplementedError();
  }

  @override
  Future<bool> create(final CommentRepository entity) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<bool> createComment(final CommentRepository comment) {
    // TODO: implement createComment
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(final int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<bool> flagComment(final int commentId, final String flagReason) {
    // TODO: implement flagComment
    throw UnimplementedError();
  }

  @override
  Future<List<CommentRepository>> getAll(
      {final int page = 1, final int pageSize = 20}) {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<CommentRepository> getById(final int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<int> getCommentCountByPost(final int postId) {
    // TODO: implement getCommentCountByPost
    throw UnimplementedError();
  }

  @override
  Future<int> getCommentCountByUser(final String userId) {
    // TODO: implement getCommentCountByUser
    throw UnimplementedError();
  }

  @override
  Future<List<CommentRepository>> getCommentsByDateRange(
      final DateTime startDate, final DateTime endDate,
      {final int page = 1, final int pageSize = 20}) {
    // TODO: implement getCommentsByDateRange
    throw UnimplementedError();
  }

  @override
  Future<List<CommentRepository>> getCommentsByPost(final int postId,
      {final int page = 1, final int pageSize = 20}) {
    // TODO: implement getCommentsByPost
    throw UnimplementedError();
  }

  @override
  Future<List<CommentRepository>> getCommentsByStatus(final String status,
      {final int page = 1, final int pageSize = 20}) {
    // TODO: implement getCommentsByStatus
    throw UnimplementedError();
  }

  @override
  Future<List<CommentRepository>> getCommentsByUser(final String userId,
      {final int page = 1, final int pageSize = 20}) {
    // TODO: implement getCommentsByUser
    throw UnimplementedError();
  }

  @override
  Future<List<CommentRepository>> getFlaggedComments(
      {final int page = 1, final int pageSize = 20}) {
    // TODO: implement getFlaggedComments
    throw UnimplementedError();
  }

  @override
  Future<CommentRepository> getMostRecentComment() {
    // TODO: implement getMostRecentComment
    throw UnimplementedError();
  }

  @override
  Future<bool> rejectComment(final int commentId) {
    // TODO: implement rejectComment
    throw UnimplementedError();
  }

  @override
  Future<List<CommentRepository>> searchComments(final String keyword,
      {final int page = 1, final int pageSize = 20}) {
    // TODO: implement searchComments
    throw UnimplementedError();
  }

  @override
  Future<bool> update(final int id, final CommentRepository updatedEntity) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<bool> updateCommentMetadata(
      final int commentId, final Map<String, dynamic> metadata) {
    // TODO: implement updateCommentMetadata
    throw UnimplementedError();
  }

  @override
  Future<bool> updateCommentStatus(
      final int commentId, final String newStatus) {
    // TODO: implement updateCommentStatus
    throw UnimplementedError();
  }
}
