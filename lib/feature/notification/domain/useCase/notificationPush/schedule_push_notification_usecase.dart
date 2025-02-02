part of use_case;

/// Doc Required
class SchedulePushNotificationParams {
  /// Doc Required
  SchedulePushNotificationParams({
    required this.title,
    required this.message,
    required this.recipientId,
    required this.scheduleTime,
  });

  /// Doc Required
  final String title;

  /// Doc Required
  final String message;

  /// Doc Required
  final String recipientId;

  /// Doc Required
  final DateTime scheduleTime;
}

/// Doc Required
class SchedulePushNotificationUseCase
    extends UseCase<void, SchedulePushNotificationParams> {
  /// Doc Required
  SchedulePushNotificationUseCase({required this.pushNotificationRepository});

  /// Doc Required
  final PushNotificationRepository<NotificationEntity>
      pushNotificationRepository;

  @override
  Future<Either<Failure, void>> call(
    final SchedulePushNotificationParams params,
  ) async {
    try {
      await pushNotificationRepository.schedulePushNotification(
        params.title,
        params.message,
        params.recipientId,
        params.scheduleTime,
      );
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to schedule push notification'),
      );
    }
  }
}
