import 'package:todo_app/core/app_library.dart';

class SendRealTimeNotificationParams {
  SendRealTimeNotificationParams({
    required this.title,
    required this.message,
    required this.recipient,
  });

  final String title;
  final String message;
  final dynamic recipient;
}

class SendRealTimeNotificationUseCase
    extends UseCase<void, SendRealTimeNotificationParams> {
  SendRealTimeNotificationUseCase({required this.notificationRepository});

  final NotificationRepository<NotificationEntity> notificationRepository;

  @override
  Future<Either<Failure, void>> call(
    final SendRealTimeNotificationParams params,
  ) async {
    try {
      await notificationRepository.sendRealTimeNotification(
        params.title,
        params.message,
        params.recipient,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to send real-time notification'));
    }
  }
}
