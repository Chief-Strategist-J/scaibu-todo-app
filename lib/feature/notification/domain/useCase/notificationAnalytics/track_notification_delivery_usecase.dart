import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/notification/domain/repository/notification_analytics_repository.dart'; // Adjust import path as necessary

class TrackNotificationDeliveryParams {
  final String notificationId;

  TrackNotificationDeliveryParams({required this.notificationId});
}

class TrackNotificationDeliveryUseCase extends UseCase<void, TrackNotificationDeliveryParams> {
  final NotificationAnalyticsRepository notificationAnalyticsRepository;

  TrackNotificationDeliveryUseCase({
    required this.notificationAnalyticsRepository,
  });

  @override
  Future<Either<Failure, void>> call(TrackNotificationDeliveryParams params) async {
    try {
      await notificationAnalyticsRepository.trackNotificationDelivery(params.notificationId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to track notification delivery'));
    }
  }
}
