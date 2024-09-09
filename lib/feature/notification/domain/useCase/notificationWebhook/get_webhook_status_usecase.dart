import 'package:todo_app/core/app_library.dart';

class GetWebhookStatusParams {
  final String webhookId;

  GetWebhookStatusParams({required this.webhookId});
}

class GetWebhookStatusUseCase extends UseCase<NotificationEntity, GetWebhookStatusParams> {
  final WebhookNotificationRepository<NotificationEntity> webhookNotificationRepository;

  GetWebhookStatusUseCase({required this.webhookNotificationRepository});

  @override
  Future<Either<Failure, NotificationEntity>> call(GetWebhookStatusParams params) async {
    try {
      final status = await webhookNotificationRepository.getWebhookStatus(params.webhookId);
      return Right(status);
    } catch (e) {
      return Left(ServerFailure('Failed to get webhook status'));
    }
  }
}
