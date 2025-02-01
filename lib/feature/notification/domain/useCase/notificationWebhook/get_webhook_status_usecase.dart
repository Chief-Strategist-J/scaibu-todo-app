part of use_case;

/// Doc Required
class GetWebhookStatusParams {
  /// Doc Required
  GetWebhookStatusParams({required this.webhookId});

  /// Doc Required
  final String webhookId;
}

/// Doc Required
class GetWebhookStatusUseCase
    extends UseCase<NotificationEntity, GetWebhookStatusParams> {
  /// Doc Required
  GetWebhookStatusUseCase({required this.webhookNotificationRepository});

  /// Doc Required
  final WebhookNotificationRepository<NotificationEntity>
      webhookNotificationRepository;

  @override
  Future<Either<Failure, NotificationEntity>> call(
    final GetWebhookStatusParams params,
  ) async {
    try {
      final NotificationEntity status = await webhookNotificationRepository
          .getWebhookStatus(params.webhookId);
      return Right<Failure, NotificationEntity>(status);
    } catch (e) {
      return Left<Failure, NotificationEntity>(
        ServerFailure('Failed to get webhook status'),
      );
    }
  }
}
