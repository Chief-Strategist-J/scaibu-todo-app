import 'package:todo_app/feature/post/domain/entity/post_entity.dart';
import 'package:todo_app/feature/post/domain/repository/post_metadata_repository.dart';

/// Doc Required
class PostMetadataImpl extends PostMetadataRepository<PostEntity> {
  /// Doc Required
  @override
  Future<void> batchUpdatePostMetadata(
    final Map<String, dynamic> metadataUpdates,
  ) {
    // TO-DO: implement batchUpdatePostMetadata
    throw UnimplementedError();
  }

  /// Doc Required
  @override
  Future<PostEntity> getPostMetadata(final int id) {
    // TO-DO: implement getPostMetadata
    throw UnimplementedError();
  }

  /// Doc Required
  @override
  Future<List<PostEntity>> getPostsByMetadata(final String key,
      final String value, {
        final int page = 1,
        final int pageSize = 20,
      }) {
    // TO-DO: implement getPostsByMetadata
    throw UnimplementedError();
  }

  /// Doc Required
  @override
  Future<void> updatePostMetadata(final int id,
      final Map<String, dynamic> metadata,) {
    // TO-DO: implement updatePostMetadata
    throw UnimplementedError();
  }
}
