import 'package:todo_app/core/app_library.dart';

class CancelScheduledEmailParams {
  CancelScheduledEmailParams({required this.emailId});

  final String emailId;
}

class CancelScheduledEmailUseCase
    extends UseCase<void, CancelScheduledEmailParams> {
  CancelScheduledEmailUseCase({required this.emailNotificationRepository});

  final EmailNotificationRepository<NotificationEntity>
      emailNotificationRepository;

  @override
  Future<Either<Failure, void>> call(
      final CancelScheduledEmailParams params) async {
    try {
      await emailNotificationRepository.cancelScheduledEmail(params.emailId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to cancel scheduled email'));
    }
  }
}
