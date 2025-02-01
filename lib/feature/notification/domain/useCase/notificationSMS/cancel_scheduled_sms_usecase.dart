part of use_case;

/// Doc Required
class CancelScheduledSMSParams {
  /// Doc Required
  CancelScheduledSMSParams({required this.smsId});

  /// Doc Required
  final String smsId;
}

/// Doc Required
class CancelScheduledSMSUseCase
    extends UseCase<void, CancelScheduledSMSParams> {
  /// Doc Required
  CancelScheduledSMSUseCase({required this.smsNotificationRepository});

  /// Doc Required
  final SMSNotificationRepository<NotificationEntity> smsNotificationRepository;

  @override
  Future<Either<Failure, void>> call(
    /// Doc Required
    final CancelScheduledSMSParams params,
  ) async {
    try {
      await smsNotificationRepository.cancelScheduledSMS(params.smsId);
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to cancel scheduled SMS'),
      );
    }
  }
}
