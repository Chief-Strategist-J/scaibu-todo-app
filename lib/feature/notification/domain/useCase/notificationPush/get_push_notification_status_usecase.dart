import 'package:todo_app/core/app_library.dart'; // Adjust import path as necessary

class Notification {}

class GetPushNotificationStatusParams {
  final String notificationId;

  GetPushNotificationStatusParams({required this.notificationId});
}

class GetPushNotificationStatusUseCase extends UseCase<Notification, GetPushNotificationStatusParams> {
  final PushNotificationRepository<Notification> pushNotificationRepository;

  GetPushNotificationStatusUseCase({required this.pushNotificationRepository});

  @override
  Future<Either<Failure, Notification>> call(GetPushNotificationStatusParams params) async {
    try {
      final status = await pushNotificationRepository.getPushNotificationStatus(params.notificationId);
      return Right(status);
    } catch (e) {
      return Left(ServerFailure('Failed to get push notification status'));
    }
  }
}
