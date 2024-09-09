import 'package:todo_app/core/app_library.dart';

class ConfigureWebhookParams {
  final String webhookId;
  final Map<String, dynamic> settings;

  ConfigureWebhookParams({required this.webhookId, required this.settings});
}

class ConfigureWebhookUseCase extends UseCase<void, ConfigureWebhookParams> {
  final WebhookNotificationRepository<NotificationEntity> webhookNotificationRepository;

  ConfigureWebhookUseCase({required this.webhookNotificationRepository});

  @override
  Future<Either<Failure, void>> call(ConfigureWebhookParams params) async {
    try {
      await webhookNotificationRepository.configureWebhook(params.webhookId, params.settings);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to configure webhook'));
    }
  }
}
