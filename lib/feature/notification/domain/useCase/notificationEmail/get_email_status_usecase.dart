import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/notification/domain/repository/email_notification_repository.dart'; // Adjust import path as necessary

class GetEmailStatusParams {
  final String emailId;
  GetEmailStatusParams({required this.emailId});
}

class GetEmailStatusUseCase extends UseCase<String, GetEmailStatusParams> {
  final EmailNotificationRepository emailNotificationRepository;

  GetEmailStatusUseCase({
    required this.emailNotificationRepository,
  });

  @override
  Future<Either<Failure, String>> call(GetEmailStatusParams params) async {
    try {
      final status = await emailNotificationRepository.getEmailStatus(params.emailId);
      return Right(status);
    } catch (e) {
      return Left(ServerFailure('Failed to get email status'));
    }
  }
}
