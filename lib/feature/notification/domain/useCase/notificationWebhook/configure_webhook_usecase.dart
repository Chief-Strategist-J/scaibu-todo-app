part of use_case;

/// Doc Required
class ConfigureWebhookParams {
  /// Doc Required

  ConfigureWebhookParams({required this.webhookId, required this.settings});

  /// Doc Required
  final String webhookId;

  /// Doc Required
  final Map<String, dynamic> settings;
}

/// Doc Required
class ConfigureWebhookUseCase extends UseCase<void, ConfigureWebhookParams> {
  /// Doc Required

  ConfigureWebhookUseCase({required this.webhookNotificationRepository});

  /// Doc Required
  final WebhookNotificationRepository<NotificationEntity>
      webhookNotificationRepository;

  @override
  Future<Either<Failure, void>> call(
    final ConfigureWebhookParams params,
  ) async {
    try {
      await webhookNotificationRepository.configureWebhook(
        params.webhookId,
        params.settings,
      );
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(ServerFailure('Failed to configure webhook'));
    }
  }
}
