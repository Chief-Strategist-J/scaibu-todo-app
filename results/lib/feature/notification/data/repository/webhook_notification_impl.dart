import 'package:todo_app/core/app_library.dart';

class WebhookNotificationImpl
    extends WebhookNotificationRepository<NotificationEntity> {
  @override
  Future<void> configureWebhook(
      final String webhookId, final Map<String, dynamic> settings) {
    // TODO: implement configureWebhook
    throw UnimplementedError();
  }

  @override
  Future<NotificationEntity> getWebhookStatus(final String webhookId) {
    // TODO: implement getWebhookStatus
    throw UnimplementedError();
  }

  @override
  Future<List<NotificationEntity>> listConfiguredWebhooks() {
    // TODO: implement listConfiguredWebhooks
    throw UnimplementedError();
  }

  @override
  Future<void> retryWebhookNotification(final String webhookId) {
    // TODO: implement retryWebhookNotification
    throw UnimplementedError();
  }

  @override
  Future<void> sendWebhookNotification(
      final String url, final Map<String, dynamic> payload) {
    // TODO: implement sendWebhookNotification
    throw UnimplementedError();
  }

  @override
  Future<void> triggerWebhookNotification(
      final String url, final Map<String, dynamic> data) {
    // TODO: implement triggerWebhookNotification
    throw UnimplementedError();
  }
}
