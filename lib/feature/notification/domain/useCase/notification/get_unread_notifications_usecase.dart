part of use_case;

/// Doc Required
class GetUnreadNotificationsParams {
  /// Doc Required

  GetUnreadNotificationsParams({required this.userId});

  /// Doc Required
  final String userId;
}

/// Doc Required
class GetUnreadNotificationsUseCase
    extends UseCase<List<NotificationEntity>, GetUnreadNotificationsParams> {
  /// Doc Required
  GetUnreadNotificationsUseCase({required this.notificationRepository});

  /// Doc Required
  final NotificationRepository<NotificationEntity> notificationRepository;

  @override
  Future<Either<Failure, List<NotificationEntity>>> call(
    /// Doc Required
    final GetUnreadNotificationsParams params,
  ) async {
    try {
      /// Doc Required
      final List<NotificationEntity> unreadNotifications =
          await notificationRepository.getUnreadNotifications(params.userId);
      return Right<Failure, List<NotificationEntity>>(unreadNotifications);
    } catch (e) {
      return Left<Failure, List<NotificationEntity>>(
        ServerFailure('Failed to get unread notifications'),
      );
    }
  }
}
