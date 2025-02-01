part of use_case;

/// Doc Required
class CancelScheduledPushNotificationParams {
  /// Doc Required
  CancelScheduledPushNotificationParams({required this.notificationId});

  /// Doc Required
  final String notificationId;
}

/// Doc Required
class CancelScheduledPushNotificationUseCase
    extends UseCase<void, CancelScheduledPushNotificationParams> {
  /// Doc Required
  CancelScheduledPushNotificationUseCase({
    required this.pushNotificationRepository,
  });

  /// Doc Required
  final PushNotificationRepository<NotificationEntity>
      pushNotificationRepository;

  @override
  Future<Either<Failure, void>> call(
    final CancelScheduledPushNotificationParams params,
  ) async {
    try {
      await pushNotificationRepository
          .cancelScheduledPushNotification(params.notificationId);
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to cancel scheduled push notification'),
      );
    }
  }
}
