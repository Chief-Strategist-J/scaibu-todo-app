import 'package:todo_app/core/app_library.dart';

class CancelScheduledPushNotificationParams {

  CancelScheduledPushNotificationParams({required this.notificationId});
  final String notificationId;
}

class CancelScheduledPushNotificationUseCase
    extends UseCase<void, CancelScheduledPushNotificationParams> {

  CancelScheduledPushNotificationUseCase({
    required this.pushNotificationRepository,
  });

  final PushNotificationRepository<NotificationEntity>
      pushNotificationRepository;

  @override
  Future<Either<Failure, void>> call(
      final CancelScheduledPushNotificationParams params) async {
    try {
      await pushNotificationRepository
          .cancelScheduledPushNotification(params.notificationId);
      return const Right(null);
    } catch (e) {
      return Left(
          ServerFailure('Failed to cancel scheduled push notification'));
    }
  }
}
