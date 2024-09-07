import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/notification/domain/repository/notification_repository.dart'; // Adjust import path as necessary

class SendRealTimeNotificationParams {
  final String title;
  final String message;
  final dynamic recipient;

  SendRealTimeNotificationParams({required this.title, required this.message, required this.recipient});
}

class SendRealTimeNotificationUseCase extends UseCase<void, SendRealTimeNotificationParams> {
  final NotificationRepository notificationRepository;

  SendRealTimeNotificationUseCase({required this.notificationRepository});

  @override
  Future<Either<Failure, void>> call(SendRealTimeNotificationParams params) async {
    try {
      await notificationRepository.sendRealTimeNotification(params.title, params.message, params.recipient);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to send real-time notification'));
    }
  }
}
