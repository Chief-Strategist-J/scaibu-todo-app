import 'package:todo_app/feature/post/domain/entity/post_entity.dart';
import 'package:todo_app/feature/post/domain/repository/post_notifications_repository.dart';

class PostNotificationsImpl extends PostNotificationsRepository<PostEntity> {
  @override
  Future<void> notifyPostComment(final int postId, final int commentId) {
    // TODO: implement notifyPostComment
    throw UnimplementedError();
  }

  @override
  Future<void> notifyPostCreation(final int id) {
    // TODO: implement notifyPostCreation
    throw UnimplementedError();
  }

  @override
  Future<void> notifyPostDeletion(final int id) {
    // TODO: implement notifyPostDeletion
    throw UnimplementedError();
  }

  @override
  Future<void> notifyPostStatusChange(final int id, final String newStatus) {
    // TODO: implement notifyPostStatusChange
    throw UnimplementedError();
  }

  @override
  Future<void> notifyPostUpdate(final int id) {
    // TODO: implement notifyPostUpdate
    throw UnimplementedError();
  }
}
