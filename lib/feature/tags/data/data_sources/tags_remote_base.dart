/// Doc Required
abstract interface class TagsRemoteBase<T> {
  /// Doc Required
  Future<List<T>> getAllTags();

  /// Doc Required
  Future<T?> getTagById(final String id);

  /// Doc Required
  Future<List<T>> getTagByTodoId(final String id);

  /// Doc Required
  Future<void> createTag(final Map<String, dynamic> data);

  /// Doc Required
  Future<void> updateTag(final String id, final Map<String, dynamic> data);

  /// Doc Required
  Future<void> deleteTag(final String id);

  /// Doc Required
  Future<List<T>> searchTags(final String query);

  /// Doc Required
  Future<void> bulkCreateTags(final List<Map<String, dynamic>> data);

  /// Doc Required
  Future<void> bulkDeleteTagsByTodoId(final String tagID);

  /// Doc Required
  Future<void> bulkDeleteTags(final List<String> ids);

  /// Doc Required
  Future<void> archiveTag(final String id);

  /// Doc Required
  Future<void> restoreTag(final String id);

  /// Doc Required
  Future<List<T>> getAllTagsByUserId(final Map<String, dynamic> data);
}
