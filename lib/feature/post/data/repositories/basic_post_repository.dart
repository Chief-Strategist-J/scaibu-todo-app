import 'package:todo_app/feature/post/domain/entity/post_entity.dart';
import 'package:todo_app/feature/post/domain/repository/basic_post_repository.dart';

/// Doc Required
class BasicPostImpl extends BasicPostRepository<PostEntity> {
  /// Doc Required
  @override
  Future<PostEntity> createPost(final Map<String, dynamic> postData) {
    // TO-DO: implement createPost
    throw UnimplementedError();
  }

  /// Doc Required
  @override
  Future<void> deletePost(final int id) {
    // TO-DO: implement deletePost
    throw UnimplementedError();
  }

  /// Doc Required
  @override
  Future<List<PostEntity>> getAllPosts({
    final int page = 1,
    final int pageSize = 20,
  }) {
    // TO-DO: implement getAllPosts
    throw UnimplementedError();
  }

  /// Doc Required
  @override
  Future<PostEntity?> getPostById(final int id) {
    // TO-DO: implement getPostById
    throw UnimplementedError();
  }

  /// Doc Required
  @override
  Future<List<PostEntity>> searchPosts(
    final String query, {
    final int page = 1,
    final int pageSize = 20,
  }) {
    // TO-DO: implement searchPosts
    throw UnimplementedError();
  }

  /// Doc Required
  @override
  Future<void> updatePost(
    final int id,
    final Map<String, dynamic> updatedData,
  ) {
    // TO-DO: implement updatePost
    throw UnimplementedError();
  }
}
