import 'package:todo_app/feature/tags/data/data_sources/tags_remote_base.dart';

  class TagsRemoteFirebase implements TagsRemoteBase {
  @override
  Future<void> archiveTag(String id) {
    throw UnimplementedError();
  }

  @override
  Future<void> bulkCreateTags(List<Map<String, dynamic>> data) {
    throw UnimplementedError();
  }

  @override
  Future<void> bulkDeleteTags(List<String> ids) {
    throw UnimplementedError();
  }

  @override
  Future<void> createTag(Map<String, dynamic> data) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTag(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List> getAllTags() {
    throw UnimplementedError();
  }

  @override
  Future getTagById(String id) {
    throw UnimplementedError();
  }

  @override
  Future<void> restoreTag(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List> searchTags(String query) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateTag(String id, Map<String, dynamic> data) {
    throw UnimplementedError();
  }
}
