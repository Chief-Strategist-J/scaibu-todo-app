part of use_case;

/// Doc Required
class TrackNotificationOpenRateParams {
  /// Doc Required
  TrackNotificationOpenRateParams({required this.notificationId});

  /// Doc Required
  final String notificationId;
}

/// Doc Required
class TrackNotificationOpenRateUseCase
    extends UseCase<void, TrackNotificationOpenRateParams> {
  /// Doc Required
  TrackNotificationOpenRateUseCase({required this.notificationRepository});

  /// Doc Required
  final NotificationAnalyticsRepository<NotificationEntity>
      notificationRepository;

  @override
  Future<Either<Failure, void>> call(
      /// Doc Required
final TrackNotificationOpenRateParams params) async {
    try {
      await notificationRepository
          .trackNotificationOpenRate(params.notificationId);
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to track notification open rate'),
      );
    }
  }
}
