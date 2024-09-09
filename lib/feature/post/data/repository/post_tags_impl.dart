import 'package:todo_app/feature/post/domain/entity/post_entity.dart';
import 'package:todo_app/feature/post/domain/repository/post_tags_repository.dart';

class PostTagsImpl extends PostTagsRepository<PostEntity> {
  @override
  Future<void> addTagsToPost(int postId, PostEntity tags) {
    // TODO: implement addTagsToPost
    throw UnimplementedError();
  }

  @override
  Future<PostEntity> getTagsForPost(int postId) {
    // TODO: implement getTagsForPost
    throw UnimplementedError();
  }

  @override
  Future<void> removeTagsFromPost(int postId, PostEntity tags) {
    // TODO: implement removeTagsFromPost
    throw UnimplementedError();
  }
}
