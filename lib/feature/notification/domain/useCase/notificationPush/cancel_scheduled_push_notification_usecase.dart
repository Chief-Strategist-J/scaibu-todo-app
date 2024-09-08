import 'package:todo_app/core/app_library.dart';

class CancelScheduledPushNotificationParams {
  final String notificationId;

  CancelScheduledPushNotificationParams({
    required this.notificationId,
  });
}

class CancelScheduledPushNotificationUseCase extends UseCase<void, CancelScheduledPushNotificationParams> {
  final PushNotificationRepository pushNotificationRepository;

  CancelScheduledPushNotificationUseCase({required this.pushNotificationRepository});

  @override
  Future<Either<Failure, void>> call(CancelScheduledPushNotificationParams params) async {
    try {
      await pushNotificationRepository.cancelScheduledPushNotification(params.notificationId);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to cancel scheduled push notification'));
    }
  }
}
