part of use_case;

/// Doc Required
class SendEmailParams {
  /// Doc Required
  SendEmailParams({
    required this.subject,
    required this.body,
    required this.recipientEmail,
  });

  /// Doc Required
  final String subject;

  /// Doc Required
  final String body;

  /// Doc Required
  final String recipientEmail;
}

/// Doc Required
class SendEmailUseCase extends UseCase<void, SendEmailParams> {
  /// Doc Required
  SendEmailUseCase({required this.emailNotificationRepository});

  /// Doc Required
  final EmailNotificationRepository<NotificationEntity>
      emailNotificationRepository;

  @override
  Future<Either<Failure, void>> call(final SendEmailParams params) async {
    try {
      await emailNotificationRepository.sendEmail(
        params.subject,
        params.body,
        params.recipientEmail,
      );
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(ServerFailure('Failed to send email'));
    }
  }
}
