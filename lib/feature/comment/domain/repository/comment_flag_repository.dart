abstract class CommentFlagRepository<CommentFlag> {
  Future<List<CommentFlag>> getFlagsForComment(int commentId);

  Future<bool> addFlagToComment(int commentId, CommentFlag flag);

  Future<bool> removeFlagFromComment(int commentId, CommentFlag flag);

  Future<List<CommentFlag>> getAllFlags({int page = 1, int pageSize = 20});

  Future<int> countFlagsForComment(int commentId);

  Future<List<CommentFlag>> getFlaggedCommentsByReason(String reason, {int page = 1, int pageSize = 20});

  Future<List<CommentFlag>> getFlaggedCommentsByDateRange(DateTime startDate, DateTime endDate, {int page = 1, int pageSize = 20});

  Future<CommentFlag> getMostFrequentFlag();
}
