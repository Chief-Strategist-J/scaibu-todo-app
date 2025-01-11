import 'package:todo_app/core/app_library.dart';

class SendPushNotificationUseCase
    extends UseCase<void, SendPushNotificationParams> {
  SendPushNotificationUseCase({required this.pushNotificationRepository});
  final PushNotificationRepository<NotificationEntity>
      pushNotificationRepository;

  @override
  Future<Either<Failure, void>> call(
      final SendPushNotificationParams params) async {
    try {
      await pushNotificationRepository.sendPushNotification(
          params.title, params.message, params.recipientId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to send push notification'));
    }
  }
}

class SendPushNotificationParams {
  SendPushNotificationParams({
    required this.title,
    required this.message,
    required this.recipientId,
  });

  final String title;
  final String message;
  final String recipientId;
}
