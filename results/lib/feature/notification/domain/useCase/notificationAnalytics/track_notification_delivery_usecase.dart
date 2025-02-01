import 'package:todo_app/core/app_library.dart';

class TrackNotificationDeliveryParams {
  TrackNotificationDeliveryParams({required this.notificationId});
  final String notificationId;
}

class TrackNotificationDeliveryUseCase
    extends UseCase<void, TrackNotificationDeliveryParams> {

  TrackNotificationDeliveryUseCase(
      {required this.notificationAnalyticsRepository});
  final NotificationAnalyticsRepository<NotificationEntity>
      notificationAnalyticsRepository;

  @override
  Future<Either<Failure, void>> call(
      final TrackNotificationDeliveryParams params) async {
    try {
      await notificationAnalyticsRepository
          .trackNotificationDelivery(params.notificationId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to track notification delivery'));
    }
  }
}
