import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/notification/domain/repository/email_notification_repository.dart'; // Adjust import path as necessary

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
  final EmailNotificationRepository emailNotificationRepository;

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
