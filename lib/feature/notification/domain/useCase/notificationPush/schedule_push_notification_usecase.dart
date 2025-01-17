import 'package:todo_app/core/app_library.dart';

class SchedulePushNotificationParams {
  final String title;
  final String message;
  final String recipientId;
  final DateTime scheduleTime;

  SchedulePushNotificationParams({
    required this.title,
    required this.message,
    required this.recipientId,
    required this.scheduleTime,
  });
}

class SchedulePushNotificationUseCase
    extends UseCase<void, SchedulePushNotificationParams> {
  final PushNotificationRepository<NotificationEntity>
      pushNotificationRepository;

  SchedulePushNotificationUseCase({required this.pushNotificationRepository});

  @override
  Future<Either<Failure, void>> call(
      final SchedulePushNotificationParams params) async {
    try {
      await pushNotificationRepository.schedulePushNotification(
        params.title,
        params.message,
        params.recipientId,
        params.scheduleTime,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to schedule push notification'));
    }
  }
}
