import 'package:todo_app/feature/post/domain/entity/post_entity.dart';
import 'package:todo_app/feature/post/domain/repository/post_notifications_repository.dart';

/// Doc Required
class PostNotificationsImpl extends PostNotificationsRepository<PostEntity> {
  /// Doc Required
  @override
  Future<void> notifyPostComment(final int postId, final int commentId) {
    // TO-DO: implement notifyPostComment
    throw UnimplementedError();
  }

  /// Doc Required
  @override
  Future<void> notifyPostCreation(final int id) {
    // TO-DO: implement notifyPostCreation
    throw UnimplementedError();
  }

  /// Doc Required
  @override
  Future<void> notifyPostDeletion(final int id) {
    // TO-DO: implement notifyPostDeletion
    throw UnimplementedError();
  }

  /// Doc Required
  @override
  Future<void> notifyPostStatusChange(final int id, final String newStatus) {
    // TO-DO: implement notifyPostStatusChange
    throw UnimplementedError();
  }

  /// Doc Required
  @override
  Future<void> notifyPostUpdate(final int id) {
    // TO-DO: implement notifyPostUpdate
    throw UnimplementedError();
  }
}
