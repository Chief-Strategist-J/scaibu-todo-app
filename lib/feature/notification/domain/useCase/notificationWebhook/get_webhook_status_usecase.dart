import 'package:todo_app/core/app_library.dart';

class GetWebhookStatusParams {
  GetWebhookStatusParams({required this.webhookId});
  final String webhookId;
}

class GetWebhookStatusUseCase
    extends UseCase<NotificationEntity, GetWebhookStatusParams> {
  GetWebhookStatusUseCase({required this.webhookNotificationRepository});
  final WebhookNotificationRepository<NotificationEntity>
      webhookNotificationRepository;

  @override
  Future<Either<Failure, NotificationEntity>> call(
      final GetWebhookStatusParams params) async {
    try {
      final NotificationEntity status = await webhookNotificationRepository
          .getWebhookStatus(params.webhookId);
      return Right(status);
    } catch (e) {
      return Left(ServerFailure('Failed to get webhook status'));
    }
  }
}
