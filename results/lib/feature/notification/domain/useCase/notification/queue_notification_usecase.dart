import 'package:todo_app/core/app_library.dart';

class QueueNotificationParams {

  QueueNotificationParams({required this.notificationData});
  final dynamic notificationData;
}

class QueueNotificationUseCase extends UseCase<void, QueueNotificationParams> {

  QueueNotificationUseCase({required this.notificationRepository});
  final NotificationRepository<NotificationEntity> notificationRepository;

  @override
  Future<Either<Failure, void>> call(final QueueNotificationParams params) async {
    try {
      await notificationRepository.queueNotification(params.notificationData);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to queue notification'));
    }
  }
}
