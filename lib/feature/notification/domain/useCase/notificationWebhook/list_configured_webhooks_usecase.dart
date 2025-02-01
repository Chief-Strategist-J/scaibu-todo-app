part of use_case;

/// Doc Required
class ListConfiguredWebhooksParams {}

/// Doc Required
class ListConfiguredWebhooksUseCase
    extends UseCase<List<NotificationEntity>, ListConfiguredWebhooksParams> {
  /// Doc Required
  ListConfiguredWebhooksUseCase({required this.webhookNotificationRepository});

  /// Doc Required
  final WebhookNotificationRepository<NotificationEntity>
      webhookNotificationRepository;

  @override
  Future<Either<Failure, List<NotificationEntity>>> call(
    final ListConfiguredWebhooksParams params,
  ) async {
    try {
      final List<NotificationEntity> webhooks =
          await webhookNotificationRepository.listConfiguredWebhooks();
      return Right<Failure, List<NotificationEntity>>(webhooks);
    } catch (e) {
      return Left<Failure, List<NotificationEntity>>(
        ServerFailure('Failed to list configured webhooks'),
      );
    }
  }
}
