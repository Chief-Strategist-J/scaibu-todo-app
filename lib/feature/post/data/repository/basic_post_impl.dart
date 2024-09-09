import 'package:todo_app/feature/post/domain/entity/post_entity.dart';
import 'package:todo_app/feature/post/domain/repository/basic_post_repository.dart';

class BasicPostImpl extends BasicPostRepository<PostEntity> {
  @override
  Future<PostEntity> createPost(Map<String, dynamic> postData) {
    // TODO: implement createPost
    throw UnimplementedError();
  }

  @override
  Future<void> deletePost(int id) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<List<PostEntity>> getAllPosts({int page = 1, int pageSize = 20}) {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }

  @override
  Future<PostEntity?> getPostById(int id) {
    // TODO: implement getPostById
    throw UnimplementedError();
  }

  @override
  Future<List<PostEntity>> searchPosts(String query, {int page = 1, int pageSize = 20}) {
    // TODO: implement searchPosts
    throw UnimplementedError();
  }

  @override
  Future<void> updatePost(int id, Map<String, dynamic> updatedData) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
