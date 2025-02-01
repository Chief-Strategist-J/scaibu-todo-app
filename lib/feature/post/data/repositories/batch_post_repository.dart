import 'package:todo_app/feature/post/domain/entity/post_entity.dart';
import 'package:todo_app/feature/post/domain/repository/batch_post_repository.dart';

/// Doc Required
class BatchPostImpl extends BatchPostRepository<PostEntity> {
  /// Doc Required
  @override
  Future<void> batchCreatePosts(final List<Map<String, dynamic>> postsData) {
    // TO-DO: implement batchCreatePosts
    throw UnimplementedError();
  }

  /// Doc Required
  @override
  Future<void> batchDeletePosts(final List<int> ids) {
    // TO-DO: implement batchDeletePosts
    throw UnimplementedError();
  }

  /// Doc Required
  @override
  Future<void> batchUpdatePosts(final Map<int, Map<String, dynamic>> updates) {
    // TO-DO: implement batchUpdatePosts
    throw UnimplementedError();
  }
}
