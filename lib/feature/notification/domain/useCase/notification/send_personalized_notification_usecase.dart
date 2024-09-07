import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/notification/domain/repository/notification_repository.dart'; // Adjust import path as necessary

class SendPersonalizedNotificationParams {
  final String title;
  final String message;
  final dynamic recipient;
  final Map<String, dynamic> personalizationData;

  SendPersonalizedNotificationParams({
    required this.title,
    required this.message,
    required this.recipient,
    required this.personalizationData,
  });
}

class SendPersonalizedNotificationUseCase extends UseCase<void, SendPersonalizedNotificationParams> {
  final NotificationRepository notificationRepository;

  SendPersonalizedNotificationUseCase({required this.notificationRepository});

  @override
  Future<Either<Failure, void>> call(SendPersonalizedNotificationParams params) async {
    try {
      await notificationRepository.sendPersonalizedNotification(params.title, params.message, params.recipient, params.personalizationData);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to send personalized notification'));
    }
  }
}
