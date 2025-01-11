import 'package:todo_app/core/app_library.dart';

class SendPersonalizedNotificationParams {
  SendPersonalizedNotificationParams({
    required this.title,
    required this.message,
    required this.recipient,
    required this.personalizationData,
  });
  final String title;
  final String message;
  final dynamic recipient;
  final Map<String, dynamic> personalizationData;
}

class SendPersonalizedNotificationUseCase
    extends UseCase<void, SendPersonalizedNotificationParams> {
  SendPersonalizedNotificationUseCase({required this.notificationRepository});
  final NotificationRepository<NotificationEntity> notificationRepository;

  @override
  Future<Either<Failure, void>> call(
      final SendPersonalizedNotificationParams params) async {
    try {
      await notificationRepository.sendPersonalizedNotification(
        params.title,
        params.message,
        params.recipient,
        params.personalizationData,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to send personalized notification'));
    }
  }
}
