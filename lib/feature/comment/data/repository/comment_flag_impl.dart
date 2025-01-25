import 'package:analyzer/dart/ast/ast.dart';
import 'package:todo_app/feature/comment/domain/repository/comment_flag_repository.dart';

class CommentFlagImpl
    extends CommentFlagRepository<CommentFlagRepository<Comment>> {
  @override
  Future<bool> addFlagToComment(
      final int commentId, final Map<String, dynamic> flag) {
    // TODO: implement addFlagToComment
    throw UnimplementedError();
  }

  @override
  Future<int> countFlagsForComment(final int commentId) {
    // TODO: implement countFlagsForComment
    throw UnimplementedError();
  }

  @override
  Future<List<CommentFlagRepository<Comment>>> getAllFlags(
      {final int page = 1, final int pageSize = 20}) {
    // TODO: implement getAllFlags
    throw UnimplementedError();
  }

  @override
  Future<List<CommentFlagRepository<Comment>>> getFlaggedCommentsByDateRange(
      final DateTime startDate, final DateTime endDate,
      {final int page = 1, final int pageSize = 20}) {
    // TODO: implement getFlaggedCommentsByDateRange
    throw UnimplementedError();
  }

  @override
  Future<List<CommentFlagRepository<Comment>>> getFlaggedCommentsByReason(
      final String reason,
      {final int page = 1,
      final int pageSize = 20}) {
    // TODO: implement getFlaggedCommentsByReason
    throw UnimplementedError();
  }

  @override
  Future<List<CommentFlagRepository<Comment>>> getFlagsForComment(
      final int commentId) {
    // TODO: implement getFlagsForComment
    throw UnimplementedError();
  }

  @override
  Future<CommentFlagRepository<Comment>> getMostFrequentFlag() {
    // TODO: implement getMostFrequentFlag
    throw UnimplementedError();
  }

  @override
  Future<bool> removeFlagFromComment(
      final int commentId, final Map<String, dynamic> flag) {
    // TODO: implement removeFlagFromComment
    throw UnimplementedError();
  }
}
