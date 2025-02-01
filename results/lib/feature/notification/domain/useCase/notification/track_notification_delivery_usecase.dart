import 'package:todo_app/core/app_library.dart'; // Adjust import path as necessary

class TrackNotificationDeliveryParams {

  TrackNotificationDeliveryParams({required this.notificationId});
  final String notificationId;
}

class TrackNotificationDeliveryUseCase
    extends UseCase<void, TrackNotificationDeliveryParams> {

  TrackNotificationDeliveryUseCase({required this.notificationRepository});

  final NotificationAnalyticsRepository<NotificationEntity>
      notificationRepository;

  @override
  Future<Either<Failure, void>> call(
      final TrackNotificationDeliveryParams params) async {
    try {
      await notificationRepository
          .trackNotificationDelivery(params.notificationId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to track notification delivery'));
    }
  }
}
