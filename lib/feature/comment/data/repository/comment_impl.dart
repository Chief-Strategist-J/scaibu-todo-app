import 'package:todo_app/feature/comment/domain/repository/comment_repository.dart';

class CommentImpl extends CommentRepository<CommentRepository> {
  @override
  Future<bool> approveComment(int commentId) {
    // TODO: implement approveComment
    throw UnimplementedError();
  }

  @override
  Future<int> count() {
    // TODO: implement count
    throw UnimplementedError();
  }

  @override
  Future<bool> create(CommentRepository entity) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<bool> createComment(CommentRepository comment) {
    // TODO: implement createComment
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<bool> flagComment(int commentId, String flagReason) {
    // TODO: implement flagComment
    throw UnimplementedError();
  }

  @override
  Future<List<CommentRepository>> getAll({int page = 1, int pageSize = 20}) {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<CommentRepository> getById(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<int> getCommentCountByPost(int postId) {
    // TODO: implement getCommentCountByPost
    throw UnimplementedError();
  }

  @override
  Future<int> getCommentCountByUser(String userId) {
    // TODO: implement getCommentCountByUser
    throw UnimplementedError();
  }

  @override
  Future<List<CommentRepository>> getCommentsByDateRange(DateTime startDate, DateTime endDate, {int page = 1, int pageSize = 20}) {
    // TODO: implement getCommentsByDateRange
    throw UnimplementedError();
  }

  @override
  Future<List<CommentRepository>> getCommentsByPost(int postId, {int page = 1, int pageSize = 20}) {
    // TODO: implement getCommentsByPost
    throw UnimplementedError();
  }

  @override
  Future<List<CommentRepository>> getCommentsByStatus(String status, {int page = 1, int pageSize = 20}) {
    // TODO: implement getCommentsByStatus
    throw UnimplementedError();
  }

  @override
  Future<List<CommentRepository>> getCommentsByUser(String userId, {int page = 1, int pageSize = 20}) {
    // TODO: implement getCommentsByUser
    throw UnimplementedError();
  }

  @override
  Future<List<CommentRepository>> getFlaggedComments({int page = 1, int pageSize = 20}) {
    // TODO: implement getFlaggedComments
    throw UnimplementedError();
  }

  @override
  Future<CommentRepository> getMostRecentComment() {
    // TODO: implement getMostRecentComment
    throw UnimplementedError();
  }

  @override
  Future<bool> rejectComment(int commentId) {
    // TODO: implement rejectComment
    throw UnimplementedError();
  }

  @override
  Future<List<CommentRepository>> searchComments(String keyword, {int page = 1, int pageSize = 20}) {
    // TODO: implement searchComments
    throw UnimplementedError();
  }

  @override
  Future<bool> update(int id, CommentRepository updatedEntity) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<bool> updateCommentMetadata(int commentId, Map<String, dynamic> metadata) {
    // TODO: implement updateCommentMetadata
    throw UnimplementedError();
  }

  @override
  Future<bool> updateCommentStatus(int commentId, String newStatus) {
    // TODO: implement updateCommentStatus
    throw UnimplementedError();
  }
}
