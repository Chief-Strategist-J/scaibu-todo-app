import 'package:todo_app/core/app_library.dart';

/// Doc Required
abstract interface class HelperTagRepository<T> {
  /// Doc Required
  Future<List<T>> getAllSeededTags();
}

/// Doc Required
class TagEndPoint {
  TagEndPoint._();

  /// Doc Required
  static const String getAllTags = 'api/v1/tags';

  /// Doc Required
  static const String createTag = 'api/v1/tags/createTag';

  /// Doc Required
  static const String updateTag = 'api/v1/tags';

  /// Doc Required
  static const String deleteTag = 'api/v1/tags';

  /// Doc Required
  static const String getAllSeeded = 'api/v1/tags/getAllSeeded'; // Adjust if needed for specific tag ID
  /// Doc Required
  static const String getAllTagsByUserId = 'api/v1/tags/getAllTagsByUserId'; // Adjust if needed for specific tag ID
  /// Doc Required
  static const String bulkCreateTags = 'api/v1/tags/bulk';

  /// Doc Required
  static const String bulkDeleteTags = 'api/v1/tags/bulkDelete';

  /// Doc Required
  static const String bulkDeleteTagsByTodoId = 'api/v1/tags/bulkDeleteTagsByTodoId';

  /// Doc Required

  static String archiveTag(final String tagId) =>
      'api/v1/tags/$tagId/archive'; // Use string interpolation
  /// Doc Required

  static String restoreTag(final String tagId) =>
      'api/v1/tags/$tagId/restore'; // Use string interpolation
  /// Doc Required
  static const String searchTags =
      'api/v1/tags/search'; // Private constructor to prevent instantiation
}

/// Doc Required

class TagsRemoteDatabaseApi
    implements TagsRemoteBase<TagEntity>, HelperTagRepository<TagEntity> {
  /// Doc Required
  const TagsRemoteDatabaseApi(this.restApi);

  /// Doc Required
  final RestApi restApi;

  @override
  Future<void> archiveTag(final String id) async {
    try {
      await restApi.request<dynamic>(
        type: HttpRequestMethod.post,
        endPoint: TagEndPoint.archiveTag(id), // Use the dynamic endpoint
        requestBody: <String, dynamic>{},
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
    } catch (e) {
      debugPrint('Error archiving tag: $e');
      throw Exception('Failed to archive tag. Please try again later.');
    }
  }

  @override
  Future<void> bulkCreateTags(final List<Map<String, dynamic>> data) async {
    try {
      await restApi.request<dynamic>(
        type: HttpRequestMethod.post,
        endPoint: TagEndPoint.bulkCreateTags,
        requestBody: <String, dynamic>{'tags': data},
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
    } catch (e) {
      debugPrint('Error bulk creating tags: $e');
      throw Exception('Failed to bulk create tags. Please try again later.');
    }
  }

  @override
  Future<void> bulkDeleteTags(final List<String> ids) async {
    try {
      await restApi.request<dynamic>(
        type: HttpRequestMethod.post,
        endPoint: TagEndPoint.bulkDeleteTags,
        requestBody: <String, dynamic>{'ids': ids},
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
    } catch (e) {
      debugPrint('Error bulk deleting tags: $e');
      throw Exception('Failed to bulk delete tags. Please try again later.');
    }
  }

  @override
  Future<void> createTag(final Map<String, dynamic> data) async {
    try {
      await restApi.request<dynamic>(
        type: HttpRequestMethod.post,
        endPoint: TagEndPoint.createTag,
        requestBody: data,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
    } catch (e) {
      debugPrint('Error creating tag: $e');
      throw Exception('Failed to create tag. Please try again later.');
    }
  }

  @override
  Future<void> deleteTag(final String id) async {
    try {
      await restApi.request<dynamic>(
        type: HttpRequestMethod.delete,
        endPoint: TagEndPoint.deleteTag, // Adjust as needed to include the ID
        requestBody: <String, dynamic>{},
        headers: <String, String>{
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
  Future<TagEntity> getTagById(final String id) {
    throw UnimplementedError();
  }

  @override
  Future<void> restoreTag(final String id) async {
    try {
      await restApi.request<dynamic>(
        type: HttpRequestMethod.post,
        endPoint: TagEndPoint.restoreTag(id), // Use the dynamic endpoint
        requestBody: <String, dynamic>{},
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
    } catch (e) {
      debugPrint('Error restoring tag: $e');
      throw Exception('Failed to restore tag. Please try again later.');
    }
  }

  @override
  Future<List<TagEntity>> searchTags(final String query) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateTag(
    final String id,
    final Map<String, dynamic> data,
  ) async {
    try {
      await restApi.request<dynamic>(
        type: HttpRequestMethod.put,
        endPoint: TagEndPoint.updateTag,
        requestBody: data,
        headers: <String, String>{
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
      final dynamic response = await restApi.request<dynamic>(
        endPoint: TagEndPoint.getAllSeeded,
        requestBody: <String, dynamic>{},
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      final ListOfTagsSeededTagResponse listOfTagsSeededTagResponse =
          ListOfTagsSeededTagResponse.fromJson(response);

      if (listOfTagsSeededTagResponse.data == null) {
        throw Exception('getAllSeededTags() data is null');
      }

      final List<TagEntity> tags = <TagEntity>[];

      final List<TagData>? list = listOfTagsSeededTagResponse.data;
      for (final TagData element in list.validate()) {
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
      debugPrint('getAllSeededTags() Error retrieving the seeded  tag: $e');
      rethrow;
    }
  }

  @override
  Future<List<TagEntity>> getTagByTodoId(final String id) async {
    try {
      final dynamic response = await restApi.request<dynamic>(
        type: HttpRequestMethod.post,
        endPoint: TagEndPoint.getAllTags,
        requestBody: <String, dynamic>{
          'todo_id': id,
          'page': 1,
        },
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      final ListOfTagsSeededTagResponse listOfTagsSeededTagResponse =
          ListOfTagsSeededTagResponse.fromJson(response);

      if (listOfTagsSeededTagResponse.data == null) {
        throw Exception('getTagByTodoId() data is null');
      }

      final List<TagEntity> tags = <TagEntity>[];

      final List<TagData> list = listOfTagsSeededTagResponse.data!;
      for (final TagData element in list) {
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
      debugPrint('getTagByTodoId() Error retrieving the seeded tag: $e');
      rethrow;
    }
  }

  @override
  Future<void> bulkDeleteTagsByTodoId(final String tagID) async {
    await restApi.request<dynamic>(
      type: HttpRequestMethod.post,
      endPoint: TagEndPoint.bulkDeleteTagsByTodoId,
      requestBody: <String, dynamic>{
        'todo_id': tagID,
      },
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
  }

  @override
  Future<List<TagEntity>> getAllTagsByUserId(
    final Map<String, dynamic> data,
  ) async {
    try {
      final dynamic response = await restApi.request<dynamic>(
        type: HttpRequestMethod.post,
        endPoint: TagEndPoint.getAllTagsByUserId,
        requestBody: data,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      final ListOfTagsSeededTagResponse listOfTagsSeededTagResponse =
          ListOfTagsSeededTagResponse.fromJson(response);

      if (listOfTagsSeededTagResponse.data == null) {
        throw Exception('getAllTagsByUserId() data is null');
      }

      final List<TagEntity> tags = <TagEntity>[];

      final List<TagData> list = listOfTagsSeededTagResponse.data!;
      for (final TagData element in list) {
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
      debugPrint('getAllTagsByUserId() Error retrieving the seeded  tag: $e');
      rethrow;
    }
  }
}
