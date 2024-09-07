import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/notification/domain/repository/notification_repository.dart'; // Adjust import path as necessary

class SendInAppNotificationParams {
  final String title;
  final String message;
  final dynamic recipient;

  SendInAppNotificationParams({
    required this.title,
    required this.message,
    required this.recipient,
  });
}

class SendInAppNotificationUseCase extends UseCase<void, SendInAppNotificationParams> {
  final NotificationRepository notificationRepository;

  SendInAppNotificationUseCase({required this.notificationRepository});

  @override
  Future<Either<Failure, void>> call(SendInAppNotificationParams params) async {
    try {
      await notificationRepository.sendInAppNotification(params.title, params.message, params.recipient);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to send in-app notification'));
    }
  }
}
