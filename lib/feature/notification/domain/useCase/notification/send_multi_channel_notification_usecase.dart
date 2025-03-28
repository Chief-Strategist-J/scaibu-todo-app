part of use_case;

/// Doc Required
class SendMultichannelNotificationParams {
  /// Doc Required
  SendMultichannelNotificationParams({
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
class SendMultichannelNotificationUseCase
    extends UseCase<void, SendMultichannelNotificationParams> {
  /// Doc Required
  SendMultichannelNotificationUseCase({required this.notificationRepository});

  /// Doc Required
  final NotificationRepository<NotificationEntity> notificationRepository;

  @override
  Future<Either<Failure, void>> call(
    /// Doc Required
    final SendMultichannelNotificationParams params,
  ) async {
    try {
      await notificationRepository.sendMultichannelNotification(
        params.title,
        params.message,
        params.recipient as NotificationEntity,
      );
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to send multichannel notification'),
      );
    }
  }
}
