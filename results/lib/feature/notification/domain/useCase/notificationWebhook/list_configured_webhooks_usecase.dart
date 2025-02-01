import 'package:todo_app/core/app_library.dart';

class ListConfiguredWebhooksParams {}

class ListConfiguredWebhooksUseCase
    extends UseCase<List<NotificationEntity>, ListConfiguredWebhooksParams> {

  ListConfiguredWebhooksUseCase({required this.webhookNotificationRepository});
  final WebhookNotificationRepository<NotificationEntity>
      webhookNotificationRepository;

  @override
  Future<Either<Failure, List<NotificationEntity>>> call(
      final ListConfiguredWebhooksParams params) async {
    try {
      final List<NotificationEntity> webhooks =
          await webhookNotificationRepository.listConfiguredWebhooks();
      return Right(webhooks);
    } catch (e) {
      return Left(ServerFailure('Failed to list configured webhooks'));
    }
  }
}
