import 'package:todo_app/core/app_library.dart'; // Adjust import path as necessary

class ListConfiguredWebhooksParams {}

class Notification {}

class ListConfiguredWebhooksUseCase extends UseCase<List<Notification>, ListConfiguredWebhooksParams> {
  final WebhookNotificationRepository<Notification> webhookNotificationRepository;

  ListConfiguredWebhooksUseCase({required this.webhookNotificationRepository});

  @override
  Future<Either<Failure, List<Notification>>> call(ListConfiguredWebhooksParams params) async {
    try {
      final webhooks = await webhookNotificationRepository.listConfiguredWebhooks();
      return Right(webhooks);
    } catch (e) {
      return Left(ServerFailure('Failed to list configured webhooks'));
    }
  }
}
