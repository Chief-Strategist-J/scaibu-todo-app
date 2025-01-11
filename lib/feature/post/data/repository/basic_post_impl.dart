import 'package:todo_app/feature/post/domain/entity/post_entity.dart';
import 'package:todo_app/feature/post/domain/repository/basic_post_repository.dart';

class BasicPostImpl extends BasicPostRepository<PostEntity> {
  @override
  Future<PostEntity> createPost(final Map<String, dynamic> postData) {
    // TODO: implement createPost
    throw UnimplementedError();
  }

  @override
  Future<void> deletePost(final int id) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<List<PostEntity>> getAllPosts({final int page = 1, final int pageSize = 20}) {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }

  @override
  Future<PostEntity?> getPostById(final int id) {
    // TODO: implement getPostById
    throw UnimplementedError();
  }

  @override
  Future<List<PostEntity>> searchPosts(final String query, {final int page = 1, final int pageSize = 20}) {
    // TODO: implement searchPosts
    throw UnimplementedError();
  }

  @override
  Future<void> updatePost(final int id, final Map<String, dynamic> updatedData) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
