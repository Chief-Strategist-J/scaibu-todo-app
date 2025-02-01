part of use_case;

/// Doc Required
class TriggerWebhookNotificationParams {
  /// Doc Required
  TriggerWebhookNotificationParams({required this.url, required this.data});

  /// Doc Required
  final String url;

  /// Doc Required
  final Map<String, dynamic> data;
}

/// Doc Required
class TriggerWebhookNotificationUseCase
    extends UseCase<void, TriggerWebhookNotificationParams> {
  /// Doc Required
  TriggerWebhookNotificationUseCase({
    required this.webhookNotificationRepository,
  });

  /// Doc Required
  final WebhookNotificationRepository<NotificationEntity>
      webhookNotificationRepository;

  @override
  Future<Either<Failure, void>> call(
    final TriggerWebhookNotificationParams params,
  ) async {
    try {
      await webhookNotificationRepository.triggerWebhookNotification(
        params.url,
        params.data,
      );

      /// Doc Required
      return const Right<Failure, void>(null);
    } catch (e) {
      /// Doc Required
      return Left<Failure, void>(
        ServerFailure('Failed to trigger webhook notification'),
      );
    }
  }
}
