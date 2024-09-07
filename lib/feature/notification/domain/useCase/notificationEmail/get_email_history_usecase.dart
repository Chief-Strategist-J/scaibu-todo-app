import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/notification/domain/repository/email_notification_repository.dart'; // Adjust import path as necessary

class GetEmailHistoryParams {
  final String userId;

  GetEmailHistoryParams({required this.userId});
}

class GetEmailHistoryUseCase extends UseCase<List<Map<String, dynamic>>, GetEmailHistoryParams> {
  final EmailNotificationRepository emailNotificationRepository;

  GetEmailHistoryUseCase({required this.emailNotificationRepository});

  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> call(GetEmailHistoryParams params) async {
    try {
      final history = await emailNotificationRepository.getEmailHistory(params.userId);
      return Right(history);
    } catch (e) {
      return Left(ServerFailure('Failed to get email history'));
    }
  }
}
