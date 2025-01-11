import 'package:todo_app/core/app_library.dart';

class TriggerWebhookNotificationParams {
  final String url;
  final Map<String, dynamic> data;

  TriggerWebhookNotificationParams({required this.url, required this.data});
}

class TriggerWebhookNotificationUseCase
    extends UseCase<void, TriggerWebhookNotificationParams> {
  final WebhookNotificationRepository<NotificationEntity>
      webhookNotificationRepository;

  TriggerWebhookNotificationUseCase(
      {required this.webhookNotificationRepository});

  @override
  Future<Either<Failure, void>> call(
      final TriggerWebhookNotificationParams params) async {
    try {
      await webhookNotificationRepository.triggerWebhookNotification(
        params.url,
        params.data,
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to trigger webhook notification'));
    }
  }
}
