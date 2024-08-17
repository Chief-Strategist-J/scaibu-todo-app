abstract interface class TagsRemoteBase<T> {
  Future<List<T>> getAllTags();

  Future<T?> getTagById(String id);

  Future<List<T>> getTagByTodoId(String id);

  Future<void> createTag(Map<String, dynamic> data);

  Future<void> updateTag(String id, Map<String, dynamic> data);

  Future<void> deleteTag(String id);

  Future<List<T>> searchTags(String query);

  Future<void> bulkCreateTags(List<Map<String, dynamic>> data);

  Future<void> bulkDeleteTagsByTodoId(String tagID);

  Future<void> bulkDeleteTags(List<String> ids);

  Future<void> archiveTag(String id);

  Future<void> restoreTag(String id);
}
