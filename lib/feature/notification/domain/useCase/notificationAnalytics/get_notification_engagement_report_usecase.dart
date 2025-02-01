part of use_case;

/// Doc Required
class GetNotificationEngagementReportParams {
  /// Doc Required
  GetNotificationEngagementReportParams({required this.userId});

  /// Doc Required
  final String userId;
}

/// Doc Required
class GetNotificationEngagementReportUseCase
    extends UseCase<NotificationEntity, GetNotificationEngagementReportParams> {
  /// Doc Required
  GetNotificationEngagementReportUseCase({
    required this.notificationAnalyticsRepository,
  });

  /// Doc Required
  final NotificationAnalyticsRepository<NotificationEntity>
      notificationAnalyticsRepository;

  @override
  Future<Either<Failure, NotificationEntity>> call(
    /// Doc Required
    final GetNotificationEngagementReportParams params,
  ) async {
    try {
      /// Doc Required
      final NotificationEntity report = await notificationAnalyticsRepository
          .getNotificationEngagementReport(params.userId);
      return Right<Failure, NotificationEntity>(report);
    } catch (e) {
      return Left<Failure, NotificationEntity>(
        ServerFailure('Failed to get notification engagement report'),
      );
    }
  }
}
