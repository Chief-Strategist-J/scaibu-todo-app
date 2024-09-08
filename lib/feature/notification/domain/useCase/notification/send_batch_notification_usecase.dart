import 'package:todo_app/core/app_library.dart';

class SendBatchNotificationParams {
  final List<String> notificationIds;

  SendBatchNotificationParams({required this.notificationIds});
}

class SendBatchNotificationUseCase extends UseCase<void, SendBatchNotificationParams> {
  final NotificationRepository<NotificationEntity> notificationRepository;

  SendBatchNotificationUseCase({required this.notificationRepository});

  @override
  Future<Either<Failure, void>> call(SendBatchNotificationParams params) async {
    try {
      await notificationRepository.sendBatchNotification(params.notificationIds);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to send batch notification'));
    }
  }
}
