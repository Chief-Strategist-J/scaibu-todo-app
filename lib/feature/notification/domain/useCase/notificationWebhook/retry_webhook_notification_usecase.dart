part of use_case;

/// Doc Required
class RetryWebhookNotificationParams {
  /// Doc Required
  RetryWebhookNotificationParams({required this.webhookId});

  /// Doc Required
  final String webhookId;
}

/// Doc Required
class RetryWebhookNotificationUseCase
    extends UseCase<void, RetryWebhookNotificationParams> {
  /// Doc Required
  RetryWebhookNotificationUseCase({
    required this.webhookNotificationRepository,
  });

  /// Doc Required
  final WebhookNotificationRepository<NotificationEntity>
      webhookNotificationRepository;

  @override
  Future<Either<Failure, void>> call(
    final RetryWebhookNotificationParams params,
  ) async {
    try {
      await webhookNotificationRepository
          .retryWebhookNotification(params.webhookId);
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to retry webhook notification'),
      );
    }
  }
}
