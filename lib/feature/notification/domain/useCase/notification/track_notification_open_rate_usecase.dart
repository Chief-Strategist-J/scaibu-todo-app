import 'package:todo_app/core/app_library.dart'; // Adjust import path as necessary

class TrackNotificationOpenRateParams {
  TrackNotificationOpenRateParams({required this.notificationId});
  final String notificationId;
}

class TrackNotificationOpenRateUseCase
    extends UseCase<void, TrackNotificationOpenRateParams> {
  TrackNotificationOpenRateUseCase({required this.notificationRepository});

  final NotificationAnalyticsRepository<NotificationEntity>
      notificationRepository;

  @override
  Future<Either<Failure, void>> call(
      final TrackNotificationOpenRateParams params) async {
    try {
      await notificationRepository
          .trackNotificationOpenRate(params.notificationId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to track notification open rate'));
    }
  }
}
