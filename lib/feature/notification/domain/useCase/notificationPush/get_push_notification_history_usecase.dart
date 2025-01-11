import 'package:todo_app/core/app_library.dart';

class GetPushNotificationHistoryParams {
  GetPushNotificationHistoryParams({required this.userId});

  final String userId;
}

class GetPushNotificationHistoryUseCase extends UseCase<
    List<NotificationEntity>, GetPushNotificationHistoryParams> {
  GetPushNotificationHistoryUseCase({required this.pushNotificationRepository});

  final PushNotificationRepository<NotificationEntity>
      pushNotificationRepository;

  @override
  Future<Either<Failure, List<NotificationEntity>>> call(
      final GetPushNotificationHistoryParams params) async {
    try {
      final List<NotificationEntity> history = await pushNotificationRepository
          .getPushNotificationHistory(params.userId);

      return Right(history);
    } catch (e) {
      return Left(ServerFailure('Failed to get push notification history'));
    }
  }
}
