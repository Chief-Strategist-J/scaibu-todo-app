part of use_case;

/// Doc Required
class SendInAppNotificationParams {
  /// Doc Required
  SendInAppNotificationParams({
    required this.title,
    required this.message,
    required this.recipient,
  });

  /// Doc Required
  final String title;

  /// Doc Required
  final String message;

  /// Doc Required
  final dynamic recipient;
}

/// Doc Required
class SendInAppNotificationUseCase
    extends UseCase<void, SendInAppNotificationParams> {
  /// Doc Required
  SendInAppNotificationUseCase({required this.notificationRepository});

  /// Doc Required
  final NotificationRepository<NotificationEntity> notificationRepository;

  @override
  Future<Either<Failure, void>> call(
    /// Doc Required
final SendInAppNotificationParams params,
  ) async {
    try {
      await notificationRepository.sendInAppNotification(
        params.title,
        params.message,
        params.recipient as NotificationEntity,
      );
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to send in-app notification'),
      );
    }
  }
}
