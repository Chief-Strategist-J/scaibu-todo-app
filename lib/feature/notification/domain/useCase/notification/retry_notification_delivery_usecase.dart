part of use_case;

/// Doc Required
class RetryNotificationDeliveryParams {
  /// Doc Required
  RetryNotificationDeliveryParams({required this.notificationId});

  /// Doc Required
  final String notificationId;
}

/// Doc Required
class RetryNotificationDeliveryUseCase
    extends UseCase<void, RetryNotificationDeliveryParams> {
  /// Doc Required
  RetryNotificationDeliveryUseCase({required this.notificationRepository});

  /// Doc Required
  final NotificationRepository<NotificationEntity> notificationRepository;

  @override
  Future<Either<Failure, void>> call(
    /// Doc Required
final RetryNotificationDeliveryParams params,
  ) async {
    try {
      await notificationRepository
          .retryNotificationDelivery(params.notificationId);
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to retry notification delivery'),
      );
    }
  }
}
