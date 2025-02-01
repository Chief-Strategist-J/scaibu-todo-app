part of use_case;

/// Doc Required
class GetNotificationStatisticsParams {
  /// Doc Required
  GetNotificationStatisticsParams({required this.userId});

  /// Doc Required
  final String userId;
}

/// Doc Required
class GetNotificationStatisticsUseCase
    extends UseCase<NotificationEntity, GetNotificationStatisticsParams> {
  /// Doc Required
  GetNotificationStatisticsUseCase({
    required this.notificationAnalyticsRepository,
  });

  /// Doc Required
  final NotificationAnalyticsRepository<NotificationEntity>
      notificationAnalyticsRepository;

  @override
  Future<Either<Failure, NotificationEntity>> call(
    final GetNotificationStatisticsParams params,
  ) async {
    try {
      /// Doc Required
      final NotificationEntity statistics =
          await notificationAnalyticsRepository
              .getNotificationStatistics(params.userId);
      return Right<Failure, NotificationEntity>(statistics);
    } catch (e) {
      return Left<Failure, NotificationEntity>(
        ServerFailure('Failed to get notification statistics'),
      );
    }
  }
}
