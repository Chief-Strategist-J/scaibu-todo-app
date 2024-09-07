import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/notification/domain/repository/notification_analytics_repository.dart'; // Adjust import path as necessary

// Define EngagementReport according to your application's needs

class EngagementReport {
  // Define properties for engagement report
}

class GetNotificationEngagementReportParams {
  final String userId;

  GetNotificationEngagementReportParams({
    required this.userId,
  });
}

class GetNotificationEngagementReportUseCase extends UseCase<EngagementReport, GetNotificationEngagementReportParams> {
  final NotificationAnalyticsRepository<EngagementReport> notificationAnalyticsRepository;

  GetNotificationEngagementReportUseCase({
    required this.notificationAnalyticsRepository,
  });

  @override
  Future<Either<Failure, EngagementReport>> call(GetNotificationEngagementReportParams params) async {
    try {
      final report = await notificationAnalyticsRepository.getNotificationEngagementReport(params.userId);
      return Right(report);
    } catch (e) {
      return Left(ServerFailure('Failed to get notification engagement report'));
    }
  }
}
