/// Doc Required
abstract class CommentFlagRepository<CommentFlag> {
  /// Doc Required
  Future<List<CommentFlag>> getFlagsForComment(final int commentId);

  /// Doc Required
  Future<bool> addFlagToComment(
    final int commentId,
    final Map<String, dynamic> flag,
  );

  /// Doc Required
  Future<bool> removeFlagFromComment(
    final int commentId,
    final Map<String, dynamic> flag,
  );

  /// Doc Required
  Future<List<CommentFlag>> getAllFlags({
    final int page = 1,
    final int pageSize = 20,
  });

  /// Doc Required
  Future<int> countFlagsForComment(final int commentId);

  /// Doc Required
  Future<List<CommentFlag>> getFlaggedCommentsByReason(
    final String reason, {
    final int page = 1,
    final int pageSize = 20,
  });

  /// Doc Required
  Future<List<CommentFlag>> getFlaggedCommentsByDateRange(
    final DateTime startDate,
    final DateTime endDate, {
    final int page = 1,
    final int pageSize = 20,
  });

  /// Doc Required
  Future<CommentFlag> getMostFrequentFlag();
}
