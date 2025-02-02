part of use_case;

/// Doc Required
class GetHistoricalNotificationDataParams {
  /// Doc Required
  GetHistoricalNotificationDataParams({
    required this.userId,
    required this.startDate,
    required this.endDate,
  });

  /// Doc Required
  final String userId;

  /// Doc Required
  final DateTime startDate;

  /// Doc Required
  final DateTime endDate;
}

/// Doc Required
class GetHistoricalNotificationDataUseCase extends UseCase<
    List<NotificationEntity>, GetHistoricalNotificationDataParams> {
  /// Doc Required
  GetHistoricalNotificationDataUseCase({
    required this.notificationAnalyticsRepository,
  });

  /// Doc Required
  final NotificationAnalyticsRepository<NotificationEntity>
      notificationAnalyticsRepository;

  @override
  Future<Either<Failure, List<NotificationEntity>>> call(
    /// Doc Required
    final GetHistoricalNotificationDataParams params,
  ) async {
    try {
      /// Doc Required
      final List<NotificationEntity> historicalData =
          await notificationAnalyticsRepository.getHistoricalNotificationData(
        params.userId,
        params.startDate,
        params.endDate,
      );

      return Right<Failure, List<NotificationEntity>>(historicalData);
    } catch (e) {
      return Left<Failure, List<NotificationEntity>>(
        ServerFailure('Failed to get historical notification data'),
      );
    }
  }
}
