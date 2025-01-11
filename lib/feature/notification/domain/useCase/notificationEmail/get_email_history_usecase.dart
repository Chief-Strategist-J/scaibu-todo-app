import 'package:todo_app/core/app_library.dart';

class GetEmailHistoryParams {
  GetEmailHistoryParams({required this.userId});
  final String userId;
}

class GetEmailHistoryUseCase<NotificationEntity>
    extends UseCase<List<NotificationEntity>, GetEmailHistoryParams> {
  GetEmailHistoryUseCase({required this.emailNotificationRepository});
  final EmailNotificationRepository<NotificationEntity>
      emailNotificationRepository;

  @override
  Future<Either<Failure, List<NotificationEntity>>> call(
      final GetEmailHistoryParams params) async {
    try {
      final history =
          await emailNotificationRepository.getEmailHistory(params.userId);
      return Right(history);
    } catch (e) {
      return Left(ServerFailure('Failed to get email history'));
    }
  }
}
