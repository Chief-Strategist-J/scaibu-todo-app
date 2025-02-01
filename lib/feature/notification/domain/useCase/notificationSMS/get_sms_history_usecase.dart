part of use_case;

/// Doc Required
class GetSMSHistoryParams {
  /// Doc Required
  GetSMSHistoryParams({required this.userId});

  /// Doc Required
  final String userId;
}

/// Doc Required
class GetSMSHistoryUseCase
    extends UseCase<List<NotificationEntity>, GetSMSHistoryParams> {
  /// Doc Required
  GetSMSHistoryUseCase({required this.smsNotificationRepository});

  /// Doc Required
  final SMSNotificationRepository<NotificationEntity> smsNotificationRepository;

  @override
  Future<Either<Failure, List<NotificationEntity>>> call(
    /// Doc Required
    final GetSMSHistoryParams params,
  ) async {
    try {
      /// Doc Required
      final List<NotificationEntity> history =
          await smsNotificationRepository.getSMSHistory(params.userId);

      return Right<Failure, List<NotificationEntity>>(history);
    } catch (e) {
      return Left<Failure, List<NotificationEntity>>(
        ServerFailure('Failed to get SMS history'),
      );
    }
  }
}
