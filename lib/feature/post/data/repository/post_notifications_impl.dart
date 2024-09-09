import 'package:todo_app/feature/post/domain/entity/post_entity.dart';
import 'package:todo_app/feature/post/domain/repository/post_notifications_repository.dart';

class PostNotificationsImpl extends PostNotificationsRepository<PostEntity> {
  @override
  Future<void> notifyPostComment(int postId, int commentId) {
    // TODO: implement notifyPostComment
    throw UnimplementedError();
  }

  @override
  Future<void> notifyPostCreation(int id) {
    // TODO: implement notifyPostCreation
    throw UnimplementedError();
  }

  @override
  Future<void> notifyPostDeletion(int id) {
    // TODO: implement notifyPostDeletion
    throw UnimplementedError();
  }

  @override
  Future<void> notifyPostStatusChange(int id, String newStatus) {
    // TODO: implement notifyPostStatusChange
    throw UnimplementedError();
  }

  @override
  Future<void> notifyPostUpdate(int id) {
    // TODO: implement notifyPostUpdate
    throw UnimplementedError();
  }
}
