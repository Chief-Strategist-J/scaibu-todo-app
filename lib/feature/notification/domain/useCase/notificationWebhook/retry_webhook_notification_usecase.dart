import 'package:todo_app/core/app_library.dart';

class RetryWebhookNotificationParams {
  final String webhookId;

  RetryWebhookNotificationParams({required this.webhookId});
}

class RetryWebhookNotificationUseCase extends UseCase<void, RetryWebhookNotificationParams> {
  final WebhookNotificationRepository webhookNotificationRepository;

  RetryWebhookNotificationUseCase({required this.webhookNotificationRepository});

  @override
  Future<Either<Failure, void>> call(RetryWebhookNotificationParams params) async {
    try {
      await webhookNotificationRepository.retryWebhookNotification(params.webhookId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to retry webhook notification'));
    }
  }
}
