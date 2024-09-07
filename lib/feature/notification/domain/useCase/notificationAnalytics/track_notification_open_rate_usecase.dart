import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/notification/domain/repository/notification_analytics_repository.dart'; // Adjust import path as necessary

class TrackNotificationOpenRateParams {
  final String notificationId;

  TrackNotificationOpenRateParams({required this.notificationId});
}

class TrackNotificationOpenRateUseCase extends UseCase<void, TrackNotificationOpenRateParams> {
  final NotificationAnalyticsRepository notificationAnalyticsRepository;

  TrackNotificationOpenRateUseCase({required this.notificationAnalyticsRepository});

  @override
  Future<Either<Failure, void>> call(TrackNotificationOpenRateParams params) async {
    try {
      await notificationAnalyticsRepository.trackNotificationOpenRate(params.notificationId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to track notification open rate'));
    }
  }
}
