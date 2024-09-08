import 'package:todo_app/core/app_library.dart';

class GetWebhookStatusParams {
  final String webhookId;

  GetWebhookStatusParams({required this.webhookId});
}

class Notification {
  //
}

class GetWebhookStatusUseCase extends UseCase<Notification, GetWebhookStatusParams> {
  final WebhookNotificationRepository<Notification> webhookNotificationRepository;

  GetWebhookStatusUseCase({required this.webhookNotificationRepository});

  @override
  Future<Either<Failure, Notification>> call(GetWebhookStatusParams params) async {
    try {
      final status = await webhookNotificationRepository.getWebhookStatus(params.webhookId);
      return Right(status);
    } catch (e) {
      return Left(ServerFailure('Failed to get webhook status'));
    }
  }
}
