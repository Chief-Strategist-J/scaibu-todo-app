import 'package:todo_app/core/app_library.dart';

class GetPushNotificationStatusParams {
  GetPushNotificationStatusParams({required this.notificationId});
  final String notificationId;
}

class GetPushNotificationStatusUseCase
    extends UseCase<NotificationEntity, GetPushNotificationStatusParams> {

  GetPushNotificationStatusUseCase({required this.pushNotificationRepository});
  final PushNotificationRepository<NotificationEntity>
      pushNotificationRepository;

  @override
  Future<Either<Failure, NotificationEntity>> call(
      final GetPushNotificationStatusParams params) async {
    try {
      final NotificationEntity status = await pushNotificationRepository
          .getPushNotificationStatus(params.notificationId);
      return Right(status);
    } catch (e) {
      return Left(ServerFailure('Failed to get push notification status'));
    }
  }
}
