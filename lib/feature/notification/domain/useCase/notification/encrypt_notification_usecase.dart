part of use_case;

/// Doc Required

class EncryptNotificationParams {
  /// Doc Required

  EncryptNotificationParams({required this.notificationId});

  /// Doc Required

  final String notificationId;
}

/// Doc Required

class EncryptNotificationUseCase
    extends UseCase<void, EncryptNotificationParams> {
  /// Doc Required

  EncryptNotificationUseCase({required this.notificationRepository});

  /// Doc Required
  final NotificationRepository<NotificationEntity> notificationRepository;

  @override
  Future<Either<Failure, void>> call(
    final EncryptNotificationParams params,
  ) async {
    try {
      await notificationRepository.encryptNotification(params.notificationId);
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to encrypt notification'),
      );
    }
  }
}
