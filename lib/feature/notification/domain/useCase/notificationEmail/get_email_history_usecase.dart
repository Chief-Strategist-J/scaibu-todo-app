import 'package:todo_app/core/app_library.dart';

class GetEmailHistoryParams {
  final String userId;

  GetEmailHistoryParams({required this.userId});
}

class GetEmailHistoryUseCase<NotificationEntity> extends UseCase<List<NotificationEntity>, GetEmailHistoryParams> {
  final EmailNotificationRepository<NotificationEntity> emailNotificationRepository;

  GetEmailHistoryUseCase({required this.emailNotificationRepository});

  @override
  Future<Either<Failure, List<NotificationEntity>>> call(GetEmailHistoryParams params) async {
    try {
      final history = await emailNotificationRepository.getEmailHistory(params.userId);
      return Right(history);
    } catch (e) {
      return Left(ServerFailure('Failed to get email history'));
    }
  }
}
