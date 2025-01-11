import 'package:todo_app/core/app_library.dart';

class SendInAppNotificationParams {
  SendInAppNotificationParams({
    required this.title,
    required this.message,
    required this.recipient,
  });

  final String title;
  final String message;
  final dynamic recipient;
}

class SendInAppNotificationUseCase
    extends UseCase<void, SendInAppNotificationParams> {
  SendInAppNotificationUseCase({required this.notificationRepository});
  final NotificationRepository<NotificationEntity> notificationRepository;

  @override
  Future<Either<Failure, void>> call(final SendInAppNotificationParams params) async {
    try {
      await notificationRepository.sendInAppNotification(
          params.title, params.message, params.recipient);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to send in-app notification'));
    }
  }
}
