import 'package:todo_app/core/app_library.dart';

class SendWebhookNotificationParams {
  final String url;
  final Map<String, dynamic> payload;

  SendWebhookNotificationParams({required this.url, required this.payload});
}

class SendWebhookNotificationUseCase extends UseCase<void, SendWebhookNotificationParams> {
  final WebhookNotificationRepository<NotificationEntity> webhookNotificationRepository;

  SendWebhookNotificationUseCase({required this.webhookNotificationRepository});

  @override
  Future<Either<Failure, void>> call(SendWebhookNotificationParams params) async {
    try {
      await webhookNotificationRepository.sendWebhookNotification(params.url, params.payload);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to send webhook notification'));
    }
  }
}
