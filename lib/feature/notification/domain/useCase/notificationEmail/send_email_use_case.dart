import 'package:todo_app/core/app_library.dart';

class SendEmailParams {
  final String subject;
  final String body;
  final String recipientEmail;

  SendEmailParams({
    required this.subject,
    required this.body,
    required this.recipientEmail,
  });
}

class SendEmailUseCase extends UseCase<void, SendEmailParams> {
  final EmailNotificationRepository<NotificationEntity> emailNotificationRepository;

  SendEmailUseCase({required this.emailNotificationRepository});

  @override
  Future<Either<Failure, void>> call(SendEmailParams params) async {
    try {
      await emailNotificationRepository.sendEmail(params.subject, params.body, params.recipientEmail);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to send email'));
    }
  }
}
