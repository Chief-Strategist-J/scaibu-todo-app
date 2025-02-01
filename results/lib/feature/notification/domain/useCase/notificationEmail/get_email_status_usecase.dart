import 'package:todo_app/core/app_library.dart';

class GetEmailStatusParams {
  GetEmailStatusParams({required this.emailId});

  final String emailId;
}

class GetEmailStatusUseCase
    extends UseCase<NotificationEntity, GetEmailStatusParams> {

  GetEmailStatusUseCase({required this.emailNotificationRepository});

  final EmailNotificationRepository<NotificationEntity>
      emailNotificationRepository;

  @override
  Future<Either<Failure, NotificationEntity>> call(
      final GetEmailStatusParams params) async {
    try {
      final NotificationEntity status =
          await emailNotificationRepository.getEmailStatus(params.emailId);

      return Right(status);
    } catch (e) {
      return Left(ServerFailure('Failed to get email status'));
    }
  }
}
