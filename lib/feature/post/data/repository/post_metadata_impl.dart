import 'package:todo_app/feature/post/domain/entity/post_entity.dart';
import 'package:todo_app/feature/post/domain/repository/post_metadata_repository.dart';

class PostMetadataImpl extends PostMetadataRepository<PostEntity> {
  @override
  Future<void> batchUpdatePostMetadata(Map<String, dynamic> metadataUpdates) {
    // TODO: implement batchUpdatePostMetadata
    throw UnimplementedError();
  }

  @override
  Future<PostEntity> getPostMetadata(int id) {
    // TODO: implement getPostMetadata
    throw UnimplementedError();
  }

  @override
  Future<List<PostEntity>> getPostsByMetadata(String key, String value, {int page = 1, int pageSize = 20}) {
    // TODO: implement getPostsByMetadata
    throw UnimplementedError();
  }

  @override
  Future<void> updatePostMetadata(int id, Map<String, dynamic> metadata) {
    // TODO: implement updatePostMetadata
    throw UnimplementedError();
  }
}
