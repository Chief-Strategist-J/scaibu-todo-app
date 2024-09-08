import 'package:todo_app/core/app_library.dart';


class CancelScheduledEmailParams {
  final String emailId;

  CancelScheduledEmailParams({required this.emailId});
}

class CancelScheduledEmailUseCase extends UseCase<void, CancelScheduledEmailParams> {
  final EmailNotificationRepository emailNotificationRepository;

  CancelScheduledEmailUseCase({
    required this.emailNotificationRepository,
  });

  @override
  Future<Either<Failure, void>> call(CancelScheduledEmailParams params) async {
    try {
      await emailNotificationRepository.cancelScheduledEmail(params.emailId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to cancel scheduled email'));
    }
  }
}
