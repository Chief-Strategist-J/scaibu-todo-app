import 'package:todo_app/core/app_library.dart';

class GetNotificationEngagementReportParams {
  final String userId;

  GetNotificationEngagementReportParams({required this.userId});
}

class GetNotificationEngagementReportUseCase extends UseCase<NotificationEntity, GetNotificationEngagementReportParams> {
  final NotificationAnalyticsRepository<NotificationEntity> notificationAnalyticsRepository;

  GetNotificationEngagementReportUseCase({required this.notificationAnalyticsRepository});

  @override
  Future<Either<Failure, NotificationEntity>> call(GetNotificationEngagementReportParams params) async {
    try {
      final report = await notificationAnalyticsRepository.getNotificationEngagementReport(params.userId);
      return Right(report);
    } catch (e) {
      return Left(ServerFailure('Failed to get notification engagement report'));
    }
  }
}
