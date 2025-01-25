abstract class CommentFlagRepository<CommentFlag> {
  Future<List<CommentFlag>> getFlagsForComment(final int commentId);

  Future<bool> addFlagToComment(
    final int commentId,
    final Map<String, dynamic> flag,
  );

  Future<bool> removeFlagFromComment(
    final int commentId,
    final Map<String, dynamic> flag,
  );

  Future<List<CommentFlag>> getAllFlags({
    final int page = 1,
    final int pageSize = 20,
  });

  Future<int> countFlagsForComment(final int commentId);

  Future<List<CommentFlag>> getFlaggedCommentsByReason(
    final String reason, {
    final int page = 1,
    final int pageSize = 20,
  });

  Future<List<CommentFlag>> getFlaggedCommentsByDateRange(
    final DateTime startDate,
    final DateTime endDate, {
    final int page = 1,
    final int pageSize = 20,
  });

  Future<CommentFlag> getMostFrequentFlag();
}
