part of use_case;

/// Doc Required
class FetchNotificationHistoryParams {
  /// Doc Required
  FetchNotificationHistoryParams({required this.userId});

  /// Doc Required
  final String userId;
}

/// Doc Required
class FetchNotificationHistoryUseCase
    extends UseCase<List<NotificationEntity>, FetchNotificationHistoryParams> {
  /// Doc Required
  FetchNotificationHistoryUseCase({required this.notificationRepository});

  /// Doc Required
  final NotificationRepository<NotificationEntity> notificationRepository;

  @override
  Future<Either<Failure, List<NotificationEntity>>> call(
    final FetchNotificationHistoryParams params,
  ) async {
    try {
      final List<NotificationEntity> history =
          await notificationRepository.fetchNotificationHistory(params.userId);
      return Right<Failure, List<NotificationEntity>>(history);
    } catch (e) {
      return Left<Failure, List<NotificationEntity>>(
        ServerFailure('Failed to fetch notification history'),
      );
    }
  }
}
