// Adjust import path as necessary
part of use_case;

/// Doc Required
class TrackNotificationDeliveryParams {
  /// Doc Required

  TrackNotificationDeliveryParams({required this.notificationId});

  /// Doc Required
  final String notificationId;
}

/// Doc Required
class TrackNotificationDeliveryUseCase
    extends UseCase<void, TrackNotificationDeliveryParams> {
  /// Doc Required
  TrackNotificationDeliveryUseCase({required this.notificationRepository});

  /// Doc Required
  final NotificationAnalyticsRepository<NotificationEntity>
      notificationRepository;

  @override
  Future<Either<Failure, void>> call(
    /// Doc Required
    final TrackNotificationDeliveryParams params,
  ) async {
    try {
      await notificationRepository
          .trackNotificationDelivery(params.notificationId);
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to track notification delivery'),
      );
    }
  }
}
