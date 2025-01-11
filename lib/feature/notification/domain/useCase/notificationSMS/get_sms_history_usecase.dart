import 'package:todo_app/core/app_library.dart';

class GetSMSHistoryParams {
  GetSMSHistoryParams({required this.userId});
  final String userId;
}

class GetSMSHistoryUseCase
    extends UseCase<List<NotificationEntity>, GetSMSHistoryParams> {
  GetSMSHistoryUseCase({required this.smsNotificationRepository});
  final SMSNotificationRepository<NotificationEntity> smsNotificationRepository;

  @override
  Future<Either<Failure, List<NotificationEntity>>> call(
      final GetSMSHistoryParams params) async {
    try {
      final List<NotificationEntity> history =
          await smsNotificationRepository.getSMSHistory(params.userId);
      return Right(history);
    } catch (e) {
      return Left(ServerFailure('Failed to get SMS history'));
    }
  }
}
