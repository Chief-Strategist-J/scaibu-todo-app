import 'package:todo_app/core/app_library.dart';

class TagsRemoteDatabaseApi implements TagsRemoteBase {
  final RestApi restApi;

  const TagsRemoteDatabaseApi(this.restApi);

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
  Future<List<dynamic>> getAllTags() {
    throw UnimplementedError();
  }

  @override
  Future<dynamic> getTagById(String id) {
    throw UnimplementedError();
  }

  @override
  Future<void> restoreTag(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<dynamic>> searchTags(String query) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateTag(String id, Map<String, dynamic> data) {
    throw UnimplementedError();
  }
}
