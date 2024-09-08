import 'package:todo_app/core/app_library.dart';

class GetPushNotificationHistoryParams {
  final String userId;

  GetPushNotificationHistoryParams({required this.userId});
}

class GetPushNotificationHistoryUseCase extends UseCase<List<NotificationEntity>, GetPushNotificationHistoryParams> {
  final PushNotificationRepository<NotificationEntity> pushNotificationRepository;

  GetPushNotificationHistoryUseCase({required this.pushNotificationRepository});

  @override
  Future<Either<Failure, List<NotificationEntity>>> call(GetPushNotificationHistoryParams params) async {
    try {
      final history = await pushNotificationRepository.getPushNotificationHistory(params.userId);
      return Right(history);
    } catch (e) {
      return Left(ServerFailure('Failed to get push notification history'));
    }
  }
}
