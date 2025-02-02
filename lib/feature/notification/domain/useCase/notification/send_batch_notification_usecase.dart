part of use_case;

/// Doc Required
class SendBatchNotificationParams {
  /// Doc Required
  SendBatchNotificationParams({required this.notificationIds});

  /// Doc Required
  final List<String> notificationIds;
}

/// Doc Required
class SendBatchNotificationUseCase
    extends UseCase<void, SendBatchNotificationParams> {
  /// Doc Required
  SendBatchNotificationUseCase({required this.notificationRepository});

  /// Doc Required
  final NotificationRepository<NotificationEntity> notificationRepository;

  @override
  Future<Either<Failure, void>> call(
    /// Doc Required
    final SendBatchNotificationParams params,
  ) async {
    try {
      await notificationRepository
          .sendBatchNotification(params.notificationIds);
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to send batch notification'),
      );
    }
  }
}
