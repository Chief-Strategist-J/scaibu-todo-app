import 'package:todo_app/feature/post/domain/entity/post_entity.dart';
import 'package:todo_app/feature/post/domain/repository/batch_post_repository.dart';

class BatchPostImpl extends BatchPostRepository<PostEntity> {
  @override
  Future<void> batchCreatePosts(List<Map<String, dynamic>> postsData) {
    // TODO: implement batchCreatePosts
    throw UnimplementedError();
  }

  @override
  Future<void> batchDeletePosts(List<int> ids) {
    // TODO: implement batchDeletePosts
    throw UnimplementedError();
  }

  @override
  Future<void> batchUpdatePosts(Map<int, Map<String, dynamic>> updates) {
    // TODO: implement batchUpdatePosts
    throw UnimplementedError();
  }
}
