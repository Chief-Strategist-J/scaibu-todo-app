import 'package:todo_app/core/app_library.dart'; // Adjust import path as necessary

class TrackNotificationOpenRateParams {
  final String notificationId;

  TrackNotificationOpenRateParams({required this.notificationId});
}

class TrackNotificationOpenRateUseCase extends UseCase<void, TrackNotificationOpenRateParams> {
  final NotificationRepository notificationRepository;

  TrackNotificationOpenRateUseCase({
    required this.notificationRepository,
  });

  @override
  Future<Either<Failure, void>> call(TrackNotificationOpenRateParams params) async {
    try {
      await notificationRepository.trackNotificationOpenRate(params.notificationId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to track notification open rate'));
    }
  }
}
