import 'package:analyzer/dart/ast/ast.dart';
import 'package:todo_app/feature/comment/domain/repository/comment_flag_repository.dart';

/// Doc Required
class CommentFlagImpl
    extends CommentFlagRepository<CommentFlagRepository<Comment>> {
  @override
  Future<bool> addFlagToComment(
    final int commentId,
    final Map<String, dynamic> flag,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<int> countFlagsForComment(final int commentId) {
    throw UnimplementedError();
  }

  @override
  Future<List<CommentFlagRepository<Comment>>> getAllFlags({
    final int page = 1,
    final int pageSize = 20,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<List<CommentFlagRepository<Comment>>> getFlaggedCommentsByDateRange(
    final DateTime startDate,
    final DateTime endDate, {
    final int page = 1,
    final int pageSize = 20,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<List<CommentFlagRepository<Comment>>> getFlaggedCommentsByReason(
    final String reason, {
    final int page = 1,
    final int pageSize = 20,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<List<CommentFlagRepository<Comment>>> getFlagsForComment(
    final int commentId,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<CommentFlagRepository<Comment>> getMostFrequentFlag() {
    throw UnimplementedError();
  }

  @override
  Future<bool> removeFlagFromComment(
    final int commentId,
    final Map<String, dynamic> flag,
  ) {
    throw UnimplementedError();
  }
}
