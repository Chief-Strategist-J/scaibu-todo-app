part of use_case;

/// Doc Required
class CategorizeNotificationParams {
  /// Doc Required
  CategorizeNotificationParams({
    required this.notificationId,
    required this.category,
  });

  /// Doc Required
  /// Doc Required
  final String notificationId;

  /// Doc Required
  final String category;
}

/// Doc Required
class CategorizeNotificationUseCase
    extends UseCase<void, CategorizeNotificationParams> {
  /// Doc Required
  CategorizeNotificationUseCase({required this.notificationRepository});

  /// Doc Required
  final NotificationRepository<NotificationEntity> notificationRepository;

  @override
  Future<Either<Failure, void>> call(
    final CategorizeNotificationParams params,
  ) async {
    try {
      await notificationRepository.categorizeNotification(
        params.notificationId,
        params.category,
      );
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to categorize notification'),
      );
    }
  }
}
