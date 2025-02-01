part of use_case;

/// Doc Required
class GetEmailHistoryParams {
  /// Doc Required
  GetEmailHistoryParams({required this.userId});

  /// Doc Required
  final String userId;
}

/// Doc Required
class GetEmailHistoryUseCase<NotificationEntity>
    extends UseCase<List<NotificationEntity>, GetEmailHistoryParams> {
  /// Doc Required
  GetEmailHistoryUseCase({required this.emailNotificationRepository});

  /// Doc Required
  final EmailNotificationRepository<NotificationEntity>
      emailNotificationRepository;

  @override
  Future<Either<Failure, List<NotificationEntity>>> call(
    final GetEmailHistoryParams params,
  ) async {
    try {
      final List<NotificationEntity> history =
          await emailNotificationRepository.getEmailHistory(params.userId);
      return Right<Failure, List<NotificationEntity>>(history);
    } catch (e) {
      return Left<Failure, List<NotificationEntity>>(
        ServerFailure('Failed to get email history'),
      );
    }
  }
}
