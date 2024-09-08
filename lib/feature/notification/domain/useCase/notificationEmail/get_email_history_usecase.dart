import 'package:todo_app/core/app_library.dart';

class GetEmailHistoryParams {
  final String userId;

  GetEmailHistoryParams({required this.userId});
}

class GetEmailHistoryUseCase<T> extends UseCase<List<T>, GetEmailHistoryParams> {
  final EmailNotificationRepository<T> emailNotificationRepository;

  GetEmailHistoryUseCase({required this.emailNotificationRepository});

  @override
  Future<Either<Failure, List<T>>> call(GetEmailHistoryParams params) async {
    try {
      final history = await emailNotificationRepository.getEmailHistory(params.userId);
      return Right(history);
    } catch (e) {
      return Left(ServerFailure('Failed to get email history'));
    }
  }
}
