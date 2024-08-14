import 'package:todo_app/core/app_library.dart';

class TagsRepositoryImpl implements TagsRepository<TagEntity> {
  final TagsRemoteBase<TagEntity> base;

  TagsRepositoryImpl({required this.base});

  @override
  Future<void> archiveTag(String id) async {
    return await base.archiveTag(id);
  }

  @override
  Future<void> bulkCreateTags(List<Map<String, dynamic>> data) async {
    return await base.bulkCreateTags(data);
  }

  @override
  Future<void> bulkDeleteTags(List<String> ids) async {
    return await base.bulkDeleteTags(ids);
  }

  @override
  Future<void> createTag(Map<String, dynamic> data) async {
    return await base.createTag(data);
  }

  @override
  Future<void> deleteTag(String id) async {
    return await base.deleteTag(id);
  }

  @override
  Future<List<TagEntity>> getAllTags() async {
    return await base.getAllTags();
  }

  @override
  Future<TagEntity?> getTagById(String id) async {
    return await base.getTagById(id);
  }

  @override
  Future<void> restoreTag(String id) async {
    return await base.restoreTag(id);
  }

  @override
  Future<List<TagEntity>> searchTags(String query) async {
    return await base.searchTags(query);
  }

  @override
  Future<void> updateTag(String id, Map<String, dynamic> data) async {
    return await base.updateTag(id, data);
  }

  @override
  Future<List<TagEntity>> getTagByTodoId(String id) async {
    return await base.getTagByTodoId(id);
  }
}
