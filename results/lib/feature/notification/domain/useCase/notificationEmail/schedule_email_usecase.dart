import 'package:todo_app/core/app_library.dart';

class ScheduleEmailParams {
  ScheduleEmailParams({
    required this.subject,
    required this.body,
    required this.recipientEmail,
    required this.scheduleTime,
  });
  final String subject;
  final String body;
  final String recipientEmail;
  final DateTime scheduleTime;
}

class ScheduleEmailUseCase extends UseCase<void, ScheduleEmailParams> {
  ScheduleEmailUseCase({required this.emailNotificationRepository});

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

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to schedule email'));
    }
  }
}
