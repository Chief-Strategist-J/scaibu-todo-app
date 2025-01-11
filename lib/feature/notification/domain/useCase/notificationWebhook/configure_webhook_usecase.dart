import 'package:todo_app/core/app_library.dart';

class ConfigureWebhookParams {
  ConfigureWebhookParams({required this.webhookId, required this.settings});
  final String webhookId;
  final Map<String, dynamic> settings;
}

class ConfigureWebhookUseCase extends UseCase<void, ConfigureWebhookParams> {
  ConfigureWebhookUseCase({required this.webhookNotificationRepository});
  final WebhookNotificationRepository<NotificationEntity>
      webhookNotificationRepository;

  @override
  Future<Either<Failure, void>> call(final ConfigureWebhookParams params) async {
    try {
      await webhookNotificationRepository.configureWebhook(
          params.webhookId, params.settings);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to configure webhook'));
    }
  }
}
