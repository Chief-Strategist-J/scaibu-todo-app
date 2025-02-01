import 'package:todo_app/feature/post/domain/entity/post_entity.dart';
import 'package:todo_app/feature/post/domain/repository/batch_post_repository.dart';

class BatchPostImpl extends BatchPostRepository<PostEntity> {
  @override
  Future<void> batchCreatePosts(final List<Map<String, dynamic>> postsData) {
    // TODO: implement batchCreatePosts
    throw UnimplementedError();
  }

  @override
  Future<void> batchDeletePosts(final List<int> ids) {
    // TODO: implement batchDeletePosts
    throw UnimplementedError();
  }

  @override
  Future<void> batchUpdatePosts(final Map<int, Map<String, dynamic>> updates) {
    // TODO: implement batchUpdatePosts
    throw UnimplementedError();
  }
}
