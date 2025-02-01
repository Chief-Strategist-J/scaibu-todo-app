import 'package:todo_app/core/app_library.dart';

class GetNotificationEngagementReportParams {
  GetNotificationEngagementReportParams({required this.userId});
  final String userId;
}

class GetNotificationEngagementReportUseCase
    extends UseCase<NotificationEntity, GetNotificationEngagementReportParams> {
  GetNotificationEngagementReportUseCase({
    required this.notificationAnalyticsRepository,
  });

  final NotificationAnalyticsRepository<NotificationEntity>
      notificationAnalyticsRepository;

  @override
  Future<Either<Failure, NotificationEntity>> call(
      final GetNotificationEngagementReportParams params) async {
    try {
      final NotificationEntity report = await notificationAnalyticsRepository
          .getNotificationEngagementReport(params.userId);
      return Right(report);
    } catch (e) {
      return Left(
          ServerFailure('Failed to get notification engagement report'));
    }
  }
}
