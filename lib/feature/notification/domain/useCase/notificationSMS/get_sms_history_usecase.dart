import 'package:todo_app/core/app_library.dart';

class GetSMSHistoryParams {
  final String userId;

  GetSMSHistoryParams({required this.userId});
}

class GetSMSHistoryUseCase extends UseCase<List<NotificationEntity>, GetSMSHistoryParams> {
  final SMSNotificationRepository<NotificationEntity> smsNotificationRepository;

  GetSMSHistoryUseCase({required this.smsNotificationRepository});

  @override
  Future<Either<Failure, List<NotificationEntity>>> call(GetSMSHistoryParams params) async {
    try {
      final history = await smsNotificationRepository.getSMSHistory(params.userId);
      return Right(history);
    } catch (e) {
      return Left(ServerFailure('Failed to get SMS history'));
    }
  }
}
