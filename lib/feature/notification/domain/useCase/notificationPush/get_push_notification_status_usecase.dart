import 'package:todo_app/core/app_library.dart';



class GetPushNotificationStatusParams {
  final String notificationId;

  GetPushNotificationStatusParams({required this.notificationId});
}

class GetPushNotificationStatusUseCase extends UseCase<NotificationEntity, GetPushNotificationStatusParams> {
  final PushNotificationRepository<NotificationEntity> pushNotificationRepository;

  GetPushNotificationStatusUseCase({required this.pushNotificationRepository});

  @override
  Future<Either<Failure, NotificationEntity>> call(GetPushNotificationStatusParams params) async {
    try {
      final status = await pushNotificationRepository.getPushNotificationStatus(params.notificationId);
      return Right(status);
    } catch (e) {
      return Left(ServerFailure('Failed to get push notification status'));
    }
  }
}
