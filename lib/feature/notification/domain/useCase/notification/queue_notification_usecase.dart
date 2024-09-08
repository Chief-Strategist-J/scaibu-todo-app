import 'package:todo_app/core/app_library.dart';

class QueueNotificationParams {
  final dynamic notificationData;

  QueueNotificationParams({required this.notificationData});
}

class QueueNotificationUseCase extends UseCase<void, QueueNotificationParams> {
  final NotificationRepository<NotificationEntity> notificationRepository;

  QueueNotificationUseCase({required this.notificationRepository});

  @override
  Future<Either<Failure, void>> call(QueueNotificationParams params) async {
    try {
      await notificationRepository.queueNotification(params.notificationData);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to queue notification'));
    }
  }
}
