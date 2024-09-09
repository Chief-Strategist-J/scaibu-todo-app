import 'package:todo_app/feature/comment/domain/repository/comment_flag_repository.dart';

class CommentFlagImpl extends CommentFlagRepository<CommentFlagRepository> {
  @override
  Future<bool> addFlagToComment(int commentId, CommentFlagRepository flag) {
    // TODO: implement addFlagToComment
    throw UnimplementedError();
  }

  @override
  Future<int> countFlagsForComment(int commentId) {
    // TODO: implement countFlagsForComment
    throw UnimplementedError();
  }

  @override
  Future<List<CommentFlagRepository>> getAllFlags({int page = 1, int pageSize = 20}) {
    // TODO: implement getAllFlags
    throw UnimplementedError();
  }

  @override
  Future<List<CommentFlagRepository>> getFlaggedCommentsByDateRange(DateTime startDate, DateTime endDate, {int page = 1, int pageSize = 20}) {
    // TODO: implement getFlaggedCommentsByDateRange
    throw UnimplementedError();
  }

  @override
  Future<List<CommentFlagRepository>> getFlaggedCommentsByReason(String reason, {int page = 1, int pageSize = 20}) {
    // TODO: implement getFlaggedCommentsByReason
    throw UnimplementedError();
  }

  @override
  Future<List<CommentFlagRepository>> getFlagsForComment(int commentId) {
    // TODO: implement getFlagsForComment
    throw UnimplementedError();
  }

  @override
  Future<CommentFlagRepository> getMostFrequentFlag() {
    // TODO: implement getMostFrequentFlag
    throw UnimplementedError();
  }

  @override
  Future<bool> removeFlagFromComment(int commentId, CommentFlagRepository flag) {
    // TODO: implement removeFlagFromComment
    throw UnimplementedError();
  }
}
