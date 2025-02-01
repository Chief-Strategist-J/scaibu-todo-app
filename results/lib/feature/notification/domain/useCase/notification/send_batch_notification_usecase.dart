import 'package:todo_app/core/app_library.dart';

class SendBatchNotificationParams {
  SendBatchNotificationParams({required this.notificationIds});
  final List<String> notificationIds;
}

class SendBatchNotificationUseCase
    extends UseCase<void, SendBatchNotificationParams> {
  SendBatchNotificationUseCase({required this.notificationRepository});
  final NotificationRepository<NotificationEntity> notificationRepository;

  @override
  Future<Either<Failure, void>> call(
      final SendBatchNotificationParams params) async {
    try {
      await notificationRepository
          .sendBatchNotification(params.notificationIds);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to send batch notification'));
    }
  }
}
