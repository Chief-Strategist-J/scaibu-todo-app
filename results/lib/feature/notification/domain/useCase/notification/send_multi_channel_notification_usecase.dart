import 'package:todo_app/core/app_library.dart';

class SendMultichannelNotificationParams {
  SendMultichannelNotificationParams({
    required this.title,
    required this.message,
    required this.recipient,
  });

  final String title;
  final String message;
  final dynamic recipient;
}

class SendMultichannelNotificationUseCase
    extends UseCase<void, SendMultichannelNotificationParams> {
  SendMultichannelNotificationUseCase({required this.notificationRepository});

  final NotificationRepository<NotificationEntity> notificationRepository;

  @override
  Future<Either<Failure, void>> call(
      final SendMultichannelNotificationParams params) async {
    try {
      await notificationRepository.sendMultichannelNotification(
          params.title, params.message, params.recipient);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to send multichannel notification'));
    }
  }
}
