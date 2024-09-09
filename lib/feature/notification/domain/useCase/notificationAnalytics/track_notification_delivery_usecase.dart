import 'package:todo_app/core/app_library.dart';

class TrackNotificationDeliveryParams {
  final String notificationId;

  TrackNotificationDeliveryParams({required this.notificationId});
}

class TrackNotificationDeliveryUseCase extends UseCase<void, TrackNotificationDeliveryParams> {
  final NotificationAnalyticsRepository<NotificationEntity> notificationAnalyticsRepository;

  TrackNotificationDeliveryUseCase({required this.notificationAnalyticsRepository});

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
