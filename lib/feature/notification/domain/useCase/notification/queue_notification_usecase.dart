part of use_case;

/// Doc Required
class QueueNotificationParams {
  /// Doc Required
  QueueNotificationParams({required this.notificationData});

  /// Doc Required
  final dynamic notificationData;
}

/// Doc Required
class QueueNotificationUseCase extends UseCase<void, QueueNotificationParams> {
  /// Doc Required

  QueueNotificationUseCase({required this.notificationRepository});

  /// Doc Required
  final NotificationRepository<NotificationEntity> notificationRepository;

  @override
  Future<Either<Failure, void>> call(
    /// Doc Required
final QueueNotificationParams params,
  ) async {
    try {
      await notificationRepository
          .queueNotification(params.notificationData as NotificationEntity);

      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(ServerFailure('Failed to queue notification'));
    }
  }
}
