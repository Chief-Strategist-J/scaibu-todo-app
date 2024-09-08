import 'package:todo_app/core/app_library.dart';

class ScheduleEmailParams {
  final String subject;
  final String body;
  final String recipientEmail;
  final DateTime scheduleTime;

  ScheduleEmailParams({
    required this.subject,
    required this.body,
    required this.recipientEmail,
    required this.scheduleTime,
  });
}

class ScheduleEmailUseCase extends UseCase<void, ScheduleEmailParams> {
  final EmailNotificationRepository emailNotificationRepository;

  ScheduleEmailUseCase({
    required this.emailNotificationRepository,
  });

  @override
  Future<Either<Failure, void>> call(ScheduleEmailParams params) async {
    try {
      await emailNotificationRepository.scheduleEmail(params.subject, params.body, params.recipientEmail, params.scheduleTime);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to schedule email'));
    }
  }
}
