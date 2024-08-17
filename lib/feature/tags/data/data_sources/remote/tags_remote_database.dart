import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/tags/data/models/response/list_of_tags_seeded_tag_response.dart';

class TagEndPoint {
  static const String getAllTags = 'api/v1/tags';
  static const String createTag = 'api/v1/tags/createTag';
  static const String updateTag = 'api/v1/tags';
  static const String deleteTag = 'api/v1/tags';
  static const String getAllSeeded = 'api/v1/tags/getAllSeeded'; // Adjust if needed for specific tag ID
  static const String bulkCreateTags = 'api/v1/tags/bulk';
  static const String bulkDeleteTags = 'api/v1/tags/bulkDelete';
  static const String bulkDeleteTagsByTodoId = 'api/v1/tags/bulkDeleteTagsByTodoId';

  static String archiveTag(String tagId) => 'api/v1/tags/$tagId/archive'; // Use string interpolation
  static String restoreTag(String tagId) => 'api/v1/tags/$tagId/restore'; // Use string interpolation
  static const String searchTags = 'api/v1/tags/search';

  TagEndPoint._(); // Private constructor to prevent instantiation
}

class TagsRemoteDatabaseApi implements TagsRemoteBase<TagEntity>, HelperTagRepository<TagEntity> {
  final RestApi restApi;

  const TagsRemoteDatabaseApi(this.restApi);

  @override
  Future<void> archiveTag(String id) async {
    try {
      await restApi.request(
        type: HttpRequestMethod.post,
        endPoint: TagEndPoint.archiveTag(id), // Use the dynamic endpoint
        requestBody: {},
        headers: {
          'Content-Type': 'application/json',
        },
      );
    } catch (e) {
      debugPrint('Error archiving tag: $e');
      throw Exception('Failed to archive tag. Please try again later.');
    }
  }

  @override
  Future<void> bulkCreateTags(List<Map<String, dynamic>> data) async {
    try {
      await restApi.request(
        type: HttpRequestMethod.post,
        endPoint: TagEndPoint.bulkCreateTags,
        requestBody: {'tags': data},
        headers: {
          'Content-Type': 'application/json',
        },
      );
    } catch (e) {
      debugPrint('Error bulk creating tags: $e');
      throw Exception('Failed to bulk create tags. Please try again later.');
    }
  }

  @override
  Future<void> bulkDeleteTags(List<String> ids) async {
    try {
      await restApi.request(
        type: HttpRequestMethod.post,
        endPoint: TagEndPoint.bulkDeleteTags,
        requestBody: {'ids': ids},
        headers: {
          'Content-Type': 'application/json',
        },
      );
    } catch (e) {
      debugPrint('Error bulk deleting tags: $e');
      throw Exception('Failed to bulk delete tags. Please try again later.');
    }
  }

  @override
  Future<void> createTag(Map<String, dynamic> data) async {
    try {
      await restApi.request(
        type: HttpRequestMethod.post,
        endPoint: TagEndPoint.createTag,
        requestBody: data,
        headers: {
          'Content-Type': 'application/json',
        },
      );
    } catch (e) {
      debugPrint('Error creating tag: $e');
      throw Exception('Failed to create tag. Please try again later.');
    }
  }

  @override
  Future<void> deleteTag(String id) async {
    try {
      await restApi.request(
        type: HttpRequestMethod.delete,
        endPoint: TagEndPoint.deleteTag, // Adjust as needed to include the ID
        requestBody: {},
        headers: {
          'Content-Type': 'application/json',
        },
      );
    } catch (e) {
      debugPrint('Error deleting tag: $e');
      throw Exception('Failed to delete tag. Please try again later.');
    }
  }

  @override
  Future<List<TagEntity>> getAllTags() {
    throw UnimplementedError();
  }

  @override
  Future<TagEntity> getTagById(String id) {
    throw UnimplementedError();
  }

  @override
  Future<void> restoreTag(String id) async {
    try {
      await restApi.request(
        type: HttpRequestMethod.post,
        endPoint: TagEndPoint.restoreTag(id), // Use the dynamic endpoint
        requestBody: {},
        headers: {
          'Content-Type': 'application/json',
        },
      );
    } catch (e) {
      debugPrint('Error restoring tag: $e');
      throw Exception('Failed to restore tag. Please try again later.');
    }
  }

  @override
  Future<List<TagEntity>> searchTags(String query) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateTag(String id, Map<String, dynamic> data) async {
    try {
      await restApi.request(
        type: HttpRequestMethod.put,
        endPoint: TagEndPoint.updateTag, // Adjust if you need to include the ID in the URL
        requestBody: data,
        headers: {
          'Content-Type': 'application/json',
        },
      );
    } catch (e) {
      debugPrint('Error updating tag: $e');
      throw Exception('Failed to update tag. Please try again later.');
    }
  }

  @override
  Future<List<TagEntity>> getAllSeededTags() async {
    try {
      final response = await restApi.request(
        type: HttpRequestMethod.get,
        endPoint: TagEndPoint.getAllSeeded,
        requestBody: {},
        headers: {
          'Content-Type': 'application/json',
        },
      );

      ListOfTagsSeededTagResponse listOfTagsSeededTagResponse = ListOfTagsSeededTagResponse.fromJson(response);

      if (listOfTagsSeededTagResponse.data == null) throw Exception("data is null");
      if (listOfTagsSeededTagResponse.data!.isEmpty) throw Exception("data is empty");

      List<TagEntity> tags = [];

      final list = listOfTagsSeededTagResponse.data!;
      for (TagData element in list) {
        tags.add(
          TagEntity(id: element.id?.toInt(), name: element.name, slug: element.slug, createdBy: element.createdBy?.toInt(), color: element.color),
        );
      }

      return tags;
    } catch (e) {
      debugPrint('Error retrieving the seeded  tag: $e');
      rethrow;
    }
  }

  @override
  Future<List<TagEntity>> getTagByTodoId(String id) async {
    try {
      final response = await restApi.request(
        type: HttpRequestMethod.post,
        endPoint: TagEndPoint.getAllTags,
        requestBody: {
          'todo_id': id,
          'page': 1,
        },
        headers: {
          'Content-Type': 'application/json',
        },
      );

      ListOfTagsSeededTagResponse listOfTagsSeededTagResponse = ListOfTagsSeededTagResponse.fromJson(response);

      if (listOfTagsSeededTagResponse.data == null) throw Exception("data is null");
      if (listOfTagsSeededTagResponse.data!.isEmpty) throw Exception("data is empty");

      List<TagEntity> tags = [];

      final list = listOfTagsSeededTagResponse.data!;
      for (TagData element in list) {
        tags.add(
          TagEntity(
            id: element.id?.toInt(),
            name: element.name,
            slug: element.slug,
            createdBy: element.createdBy?.toInt(),
            color: element.color,
          ),
        );
      }

      return tags;
    } catch (e) {
      debugPrint('Error retrieving the seeded  tag: $e');
      rethrow;
    }
  }

  @override
  Future<void> bulkDeleteTagsByTodoId(String tagID) async {
    await restApi.request(
      type: HttpRequestMethod.post,
      endPoint: TagEndPoint.bulkDeleteTagsByTodoId,
      requestBody: {
        'todo_id': tagID,
      },
      headers: {
        'Content-Type': 'application/json',
      },
    );
  }
}
