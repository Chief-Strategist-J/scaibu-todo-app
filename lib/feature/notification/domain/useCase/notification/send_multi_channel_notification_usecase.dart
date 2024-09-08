import 'package:todo_app/core/app_library.dart';

class SendMultichannelNotificationParams {
  final String title;
  final String message;
  final dynamic recipient;

  SendMultichannelNotificationParams({
    required this.title,
    required this.message,
    required this.recipient,
  });
}

class SendMultichannelNotificationUseCase extends UseCase<void, SendMultichannelNotificationParams> {
  final NotificationRepository<NotificationEntity> notificationRepository;

  SendMultichannelNotificationUseCase({
    required this.notificationRepository,
  });

  @override
  Future<Either<Failure, void>> call(SendMultichannelNotificationParams params) async {
    try {
      await notificationRepository.sendMultichannelNotification(params.title, params.message, params.recipient);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to send multichannel notification'));
    }
  }
}
