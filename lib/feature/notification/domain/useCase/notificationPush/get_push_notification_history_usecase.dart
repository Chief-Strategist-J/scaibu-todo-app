part of use_case;

/// Doc Required
class GetPushNotificationHistoryParams {
  /// Doc Required
  GetPushNotificationHistoryParams({required this.userId});

  /// Doc Required
  final String userId;
}

/// Doc Required
class GetPushNotificationHistoryUseCase extends UseCase<
    List<NotificationEntity>, GetPushNotificationHistoryParams> {
  /// Doc Required
  GetPushNotificationHistoryUseCase({required this.pushNotificationRepository});

  /// Doc Required
  final PushNotificationRepository<NotificationEntity>
      pushNotificationRepository;

  @override
  Future<Either<Failure, List<NotificationEntity>>> call(
    final GetPushNotificationHistoryParams params,
  ) async {
    try {
      final List<NotificationEntity> history = await pushNotificationRepository
          .getPushNotificationHistory(params.userId);

      return Right<Failure, List<NotificationEntity>>(history);
    } catch (e) {
      return Left<Failure, List<NotificationEntity>>(
        ServerFailure('Failed to get push notification history'),
      );
    }
  }
}
