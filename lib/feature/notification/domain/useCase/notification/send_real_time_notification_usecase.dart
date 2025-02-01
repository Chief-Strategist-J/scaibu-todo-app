part of use_case;

/// Doc Required
class SendRealTimeNotificationParams {
  /// Doc Required
  SendRealTimeNotificationParams({
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
class SendRealTimeNotificationUseCase
    extends UseCase<void, SendRealTimeNotificationParams> {
  /// Doc Required
  SendRealTimeNotificationUseCase({required this.notificationRepository});

  /// Doc Required
  final NotificationRepository<NotificationEntity> notificationRepository;

  @override
  Future<Either<Failure, void>> call(
    final SendRealTimeNotificationParams params,
  ) async {
    try {
      await notificationRepository.sendRealTimeNotification(
        params.title,
        params.message,
        params.recipient as NotificationEntity,
      );
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to send real-time notification'),
      );
    }
  }
}
