import 'package:analyzer/dart/ast/ast.dart';
import 'package:todo_app/feature/comment/domain/repository/comment_repository.dart';

class CommentImpl extends CommentRepository<CommentRepository<Comment>> {
  @override
  Future<bool> approveComment(final int commentId) {
    throw UnimplementedError();
  }

  @override
  Future<int> count() {
    throw UnimplementedError();
  }

  @override
  Future<bool> create(final CommentRepository<Comment> entity) {
    throw UnimplementedError();
  }

  @override
  Future<bool> createComment(final CommentRepository<Comment> comment) {
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(final int id) {
    throw UnimplementedError();
  }

  @override
  Future<bool> flagComment(final int commentId, final String flagReason) {
    throw UnimplementedError();
  }

  @override
  Future<List<CommentRepository<Comment>>> getAll(
      {final int page = 1, final int pageSize = 20}) {
    throw UnimplementedError();
  }

  @override
  Future<CommentRepository<Comment>> getById(final int id) {
    throw UnimplementedError();
  }

  @override
  Future<int> getCommentCountByPost(final int postId) {
    throw UnimplementedError();
  }

  @override
  Future<int> getCommentCountByUser(final String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<CommentRepository<Comment>>> getCommentsByDateRange(
      final DateTime startDate, final DateTime endDate,
      {final int page = 1, final int pageSize = 20}) {
    throw UnimplementedError();
  }

  @override
  Future<List<CommentRepository<Comment>>> getCommentsByPost(final int postId,
      {final int page = 1, final int pageSize = 20}) {
    throw UnimplementedError();
  }

  @override
  Future<List<CommentRepository<Comment>>> getCommentsByStatus(
      final String status,
      {final int page = 1,
      final int pageSize = 20}) {
    throw UnimplementedError();
  }

  @override
  Future<List<CommentRepository<Comment>>> getCommentsByUser(
      final String userId,
      {final int page = 1,
      final int pageSize = 20}) {
    throw UnimplementedError();
  }

  @override
  Future<List<CommentRepository<Comment>>> getFlaggedComments(
      {final int page = 1, final int pageSize = 20}) {
    throw UnimplementedError();
  }

  @override
  Future<CommentRepository<Comment>> getMostRecentComment() {
    throw UnimplementedError();
  }

  @override
  Future<bool> rejectComment(final int commentId) {
    throw UnimplementedError();
  }

  @override
  Future<List<CommentRepository<Comment>>> searchComments(final String keyword,
      {final int page = 1, final int pageSize = 20}) {
    throw UnimplementedError();
  }

  @override
  Future<bool> update(
      final int id, final CommentRepository<Comment> updatedEntity) {
    throw UnimplementedError();
  }

  @override
  Future<bool> updateCommentMetadata(
      final int commentId, final Map<String, dynamic> metadata) {
    throw UnimplementedError();
  }

  @override
  Future<bool> updateCommentStatus(
      final int commentId, final String newStatus) {
    throw UnimplementedError();
  }
}
