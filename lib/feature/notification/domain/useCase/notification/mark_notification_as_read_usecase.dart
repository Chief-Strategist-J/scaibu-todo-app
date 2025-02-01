part of use_case;

/// Doc Required
class MarkNotificationAsReadParams {
  /// Doc Required

  MarkNotificationAsReadParams({required this.notificationId});

  /// Doc Required
  /// Doc Required
final String notificationId;
}

/// Doc Required
class MarkNotificationAsReadUseCase
    extends UseCase<void, MarkNotificationAsReadParams> {
  /// Doc Required

  MarkNotificationAsReadUseCase({required this.notificationRepository});

  /// Doc Required
  /// Doc Required
final NotificationRepository<NotificationEntity> notificationRepository;

  @override
  Future<Either<Failure, void>> call(
    /// Doc Required
final MarkNotificationAsReadParams params,
  ) async {
    try {
      await notificationRepository
          .markNotificationAsRead(params.notificationId);

      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to mark notification as read'),
      );
    }
  }
}
