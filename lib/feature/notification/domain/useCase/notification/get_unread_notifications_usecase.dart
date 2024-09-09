import 'package:todo_app/core/app_library.dart';

class GetUnreadNotificationsParams {
  final String userId;

  GetUnreadNotificationsParams({required this.userId});
}

class GetUnreadNotificationsUseCase extends UseCase<List<NotificationEntity>, GetUnreadNotificationsParams> {
  final NotificationRepository<NotificationEntity> notificationRepository;

  GetUnreadNotificationsUseCase({required this.notificationRepository});

  @override
  Future<Either<Failure, List<NotificationEntity>>> call(GetUnreadNotificationsParams params) async {
    try {
      final unreadNotifications = await notificationRepository.getUnreadNotifications(params.userId);
      return Right(unreadNotifications);
    } catch (e) {
      return Left(ServerFailure('Failed to get unread notifications'));
    }
  }
}
