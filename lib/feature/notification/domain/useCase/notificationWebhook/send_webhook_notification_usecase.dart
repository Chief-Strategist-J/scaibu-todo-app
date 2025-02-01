part of use_case;

/// Doc Required
class SendWebhookNotificationParams {
  /// Doc Required
  SendWebhookNotificationParams({required this.url, required this.payload});

  /// Doc Required
  final String url;

  /// Doc Required
  final Map<String, dynamic> payload;
}

/// Doc Required
class SendWebhookNotificationUseCase
    extends UseCase<void, SendWebhookNotificationParams> {
  /// Doc Required
  SendWebhookNotificationUseCase({required this.webhookNotificationRepository});

  /// Doc Required
  final WebhookNotificationRepository<NotificationEntity>
      webhookNotificationRepository;

  @override
  Future<Either<Failure, void>> call(
    final SendWebhookNotificationParams params,
  ) async {
    try {
      await webhookNotificationRepository.sendWebhookNotification(
        params.url,
        params.payload,
      );
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to send webhook notification'),
      );
    }
  }
}
