part of use_case;

/// Doc Required
class SendPushNotificationUseCase
    extends UseCase<void, SendPushNotificationParams> {
  /// Doc Required
  SendPushNotificationUseCase({required this.pushNotificationRepository});

  /// Doc Required
  final PushNotificationRepository<NotificationEntity>
      pushNotificationRepository;

  @override
  Future<Either<Failure, void>> call(
    /// Doc Required
    final SendPushNotificationParams params,
  ) async {
    try {
      await pushNotificationRepository.sendPushNotification(
        params.title,
        params.message,
        params.recipientId,
      );
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
          ServerFailure('Failed to send push notification'));
    }
  }
}

/// Doc Required
class SendPushNotificationParams {
  /// Doc Required
  SendPushNotificationParams({
    required this.title,
    required this.message,
    required this.recipientId,
  });

  /// Doc Required
  final String title;

  /// Doc Required
  final String message;

  /// Doc Required
  final String recipientId;
}
