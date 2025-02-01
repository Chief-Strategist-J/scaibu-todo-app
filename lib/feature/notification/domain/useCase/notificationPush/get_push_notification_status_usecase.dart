part of use_case;

/// Doc Required
class GetPushNotificationStatusParams {
  /// Doc Required
  GetPushNotificationStatusParams({required this.notificationId});

  /// Doc Required
  final String notificationId;
}

/// Doc Required
class GetPushNotificationStatusUseCase
    extends UseCase<NotificationEntity, GetPushNotificationStatusParams> {
  /// Doc Required
  GetPushNotificationStatusUseCase({required this.pushNotificationRepository});

  /// Doc Required
  final PushNotificationRepository<NotificationEntity>
      pushNotificationRepository;

  @override
  Future<Either<Failure, NotificationEntity>> call(
    /// Doc Required
    final GetPushNotificationStatusParams params,
  ) async {
    try {
      /// Doc Required
      final NotificationEntity status = await pushNotificationRepository
          .getPushNotificationStatus(params.notificationId);
      return Right<Failure, NotificationEntity>(status);
    } catch (e) {
      return Left<Failure, NotificationEntity>(
        ServerFailure('Failed to get push notification status'),
      );
    }
  }
}
