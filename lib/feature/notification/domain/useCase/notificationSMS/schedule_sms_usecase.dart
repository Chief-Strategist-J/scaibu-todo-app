part of use_case;

/// Doc Required
class ScheduleSMSParams {
  /// Doc Required

  ScheduleSMSParams({
    required this.message,
    required this.recipientPhoneNumber,
    required this.scheduleTime,
  });

  /// Doc Required
  final String message;

  /// Doc Required
  final String recipientPhoneNumber;

  /// Doc Required
  final DateTime scheduleTime;
}

/// Doc Required
class ScheduleSMSUseCase extends UseCase<void, ScheduleSMSParams> {
  /// Doc Required

  ScheduleSMSUseCase({required this.smsNotificationRepository});

  /// Doc Required
  final SMSNotificationRepository<NotificationEntity> smsNotificationRepository;

  @override
  Future<Either<Failure, void>> call(
    /// Doc Required
    final ScheduleSMSParams params,
  ) async {
    try {
      await smsNotificationRepository.scheduleSMS(
        params.message,
        params.recipientPhoneNumber,
        params.scheduleTime,
      );
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(ServerFailure('Failed to schedule SMS'));
    }
  }
}
