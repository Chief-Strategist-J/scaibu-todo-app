part of use_case;

/// Doc Required
class ScheduleEmailParams {
  /// Doc Required
  ScheduleEmailParams({
    required this.subject,
    required this.body,
    required this.recipientEmail,
    required this.scheduleTime,
  });

  /// Doc Required
  final String subject;

  /// Doc Required
  final String body;

  /// Doc Required
  final String recipientEmail;

  /// Doc Required
  final DateTime scheduleTime;
}

/// Doc Required
class ScheduleEmailUseCase extends UseCase<void, ScheduleEmailParams> {
  /// Doc Required
  ScheduleEmailUseCase({required this.emailNotificationRepository});

  /// Doc Required
  final EmailNotificationRepository<NotificationEntity>
      emailNotificationRepository;

  @override
  Future<Either<Failure, void>> call(final ScheduleEmailParams params) async {
    try {
      await emailNotificationRepository.scheduleEmail(
        params.subject,
        params.body,
        params.recipientEmail,
        params.scheduleTime,
      );

      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(ServerFailure('Failed to schedule email'));
    }
  }
}
