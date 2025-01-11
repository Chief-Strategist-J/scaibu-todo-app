import 'package:todo_app/feature/post/domain/entity/post_entity.dart';
import 'package:todo_app/feature/post/domain/repository/post_metadata_repository.dart';

class PostMetadataImpl extends PostMetadataRepository<PostEntity> {
  @override
  Future<void> batchUpdatePostMetadata(
      final Map<String, dynamic> metadataUpdates) {
    // TODO: implement batchUpdatePostMetadata
    throw UnimplementedError();
  }

  @override
  Future<PostEntity> getPostMetadata(final int id) {
    // TODO: implement getPostMetadata
    throw UnimplementedError();
  }

  @override
  Future<List<PostEntity>> getPostsByMetadata(
      final String key, final String value,
      {final int page = 1, final int pageSize = 20}) {
    // TODO: implement getPostsByMetadata
    throw UnimplementedError();
  }

  @override
  Future<void> updatePostMetadata(
      final int id, final Map<String, dynamic> metadata) {
    // TODO: implement updatePostMetadata
    throw UnimplementedError();
  }
}
