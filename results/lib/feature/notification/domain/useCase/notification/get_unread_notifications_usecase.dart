import 'package:todo_app/core/app_library.dart';

class GetUnreadNotificationsParams {
  GetUnreadNotificationsParams({required this.userId});
  final String userId;
}

class GetUnreadNotificationsUseCase
    extends UseCase<List<NotificationEntity>, GetUnreadNotificationsParams> {
  GetUnreadNotificationsUseCase({required this.notificationRepository});
  final NotificationRepository<NotificationEntity> notificationRepository;

  @override
  Future<Either<Failure, List<NotificationEntity>>> call(
      final GetUnreadNotificationsParams params) async {
    try {
      final List<NotificationEntity> unreadNotifications =
          await notificationRepository.getUnreadNotifications(params.userId);
      return Right(unreadNotifications);
    } catch (e) {
      return Left(ServerFailure('Failed to get unread notifications'));
    }
  }
}
