import 'package:todo_app/core/app_library.dart';

class ListConfiguredWebhooksParams {}

class ListConfiguredWebhooksUseCase extends UseCase<List<NotificationEntity>, ListConfiguredWebhooksParams> {
  final WebhookNotificationRepository<NotificationEntity> webhookNotificationRepository;

  ListConfiguredWebhooksUseCase({required this.webhookNotificationRepository});

  @override
  Future<Either<Failure, List<NotificationEntity>>> call(ListConfiguredWebhooksParams params) async {
    try {
      final webhooks = await webhookNotificationRepository.listConfiguredWebhooks();
      return Right(webhooks);
    } catch (e) {
      return Left(ServerFailure('Failed to list configured webhooks'));
    }
  }
}
