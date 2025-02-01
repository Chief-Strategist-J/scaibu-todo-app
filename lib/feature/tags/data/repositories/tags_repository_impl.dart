import 'package:todo_app/core/app_library.dart';

/// Doc Required
class TagsRepositoryImpl implements TagsRepository<TagEntity> {
  /// Doc Required
  TagsRepositoryImpl({required this.base});

  /// Doc Required
  final TagsRemoteBase<TagEntity> base;

  @override
  Future<void> archiveTag(final String id) async => base.archiveTag(id);

  @override
  Future<void> bulkCreateTags(final List<Map<String, dynamic>> data) async =>
      base.bulkCreateTags(data);

  @override
  Future<void> bulkDeleteTags(final List<String> ids) async =>
      base.bulkDeleteTags(ids);

  @override
  Future<void> createTag(final Map<String, dynamic> data) async =>
      base.createTag(data);

  @override
  Future<void> deleteTag(final String id) async => base.deleteTag(id);

  @override
  Future<List<TagEntity>> getAllTags() async => base.getAllTags();

  @override
  Future<TagEntity?> getTagById(final String id) async => base.getTagById(id);

  @override
  Future<void> restoreTag(final String id) async => base.restoreTag(id);

  @override
  Future<List<TagEntity>> searchTags(final String query) async =>
      base.searchTags(query);

  @override
  Future<void> updateTag(
    final String id,
    final Map<String, dynamic> data,
  ) async =>
      base.updateTag(id, data);

  @override
  Future<List<TagEntity>> getTagByTodoId(final String id) async =>
      base.getTagByTodoId(id);

  @override
  Future<void> bulkDeleteTagsByTodoId(final String tagId) async {
    await base.bulkDeleteTagsByTodoId(tagId);
  }

  @override
  Future<List<TagEntity>> getAllTagsByUserId(
    final Map<String, dynamic> data,
  ) async =>
      base.getAllTagsByUserId(data);
}
