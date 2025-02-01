import 'package:todo_app/feature/post/domain/entity/post_entity.dart';
import 'package:todo_app/feature/post/domain/repository/post_tags_repository.dart';

/// Doc Required
class PostTagsImpl extends PostTagsRepository<PostEntity> {
  /// Doc Required
  @override
  Future<void> addTagsToPost(final int postId, final PostEntity tags) {
    // TO-DO: implement addTagsToPost
    throw UnimplementedError();
  }

  /// Doc Required
  @override
  Future<PostEntity> getTagsForPost(final int postId) {
    // TO-DO: implement getTagsForPost
    throw UnimplementedError();
  }

  /// Doc Required
  @override
  Future<void> removeTagsFromPost(final int postId, final PostEntity tags) {
    // TO-DO: implement removeTagsFromPost
    throw UnimplementedError();
  }
}
