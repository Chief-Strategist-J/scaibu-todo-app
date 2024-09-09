import 'package:todo_app/feature/post/domain/entity/post_entity.dart';
import 'package:todo_app/feature/post/domain/repository/post_reactions_repository.dart';

class PostReactionsImpl extends PostReactionsRepository<PostEntity> {
  @override
  Future<void> addReaction(int postId, String reactionType) {
    // TODO: implement addReaction
    throw UnimplementedError();
  }

  @override
  Future<PostEntity> getReactionsCount(int postId) {
    // TODO: implement getReactionsCount
    throw UnimplementedError();
  }

  @override
  Future<void> removeReaction(int postId, String reactionType) {
    // TODO: implement removeReaction
    throw UnimplementedError();
  }
}
