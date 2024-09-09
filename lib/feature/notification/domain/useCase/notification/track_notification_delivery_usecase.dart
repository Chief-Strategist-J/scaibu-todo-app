import 'package:todo_app/core/app_library.dart'; // Adjust import path as necessary

class TrackNotificationDeliveryParams {
  final String notificationId;

  TrackNotificationDeliveryParams({required this.notificationId});
}

class TrackNotificationDeliveryUseCase extends UseCase<void, TrackNotificationDeliveryParams> {
  final NotificationAnalyticsRepository<NotificationEntity> notificationRepository;

  TrackNotificationDeliveryUseCase({required this.notificationRepository});

  @override
  Future<Either<Failure, void>> call(TrackNotificationDeliveryParams params) async {
    try {
      await notificationRepository.trackNotificationDelivery(params.notificationId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to track notification delivery'));
    }
  }
}
