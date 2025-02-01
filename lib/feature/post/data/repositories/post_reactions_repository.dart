import 'package:todo_app/feature/post/domain/entity/post_entity.dart';
import 'package:todo_app/feature/post/domain/repository/post_reactions_repository.dart';

/// Doc Required
class PostReactionsImpl extends PostReactionsRepository<PostEntity> {
  /// Doc Required
  @override
  Future<void> addReaction(final int postId, final String reactionType) {
    // TO-DO: implement addReaction
    throw UnimplementedError();
  }

  /// Doc Required
  @override
  Future<PostEntity> getReactionsCount(final int postId) {
    // TO-DO: implement getReactionsCount
    throw UnimplementedError();
  }

  /// Doc Required
  @override
  Future<void> removeReaction(final int postId, final String reactionType) {
    // TO-DO: implement removeReaction
    throw UnimplementedError();
  }
}
