part of use_case;

/// Doc Required
class CancelScheduledEmailParams {
  /// Doc Required
  CancelScheduledEmailParams({required this.emailId});

  /// Doc Required
  final String emailId;
}

/// Doc Required
class CancelScheduledEmailUseCase
    extends UseCase<void, CancelScheduledEmailParams> {
  /// Doc Required
  CancelScheduledEmailUseCase({required this.emailNotificationRepository});

  /// Doc Required
  final EmailNotificationRepository<NotificationEntity>
      emailNotificationRepository;

  @override
  Future<Either<Failure, void>> call(
    final CancelScheduledEmailParams params,
  ) async {
    try {
      await emailNotificationRepository.cancelScheduledEmail(params.emailId);
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to cancel scheduled email'),
      );
    }
  }
}
