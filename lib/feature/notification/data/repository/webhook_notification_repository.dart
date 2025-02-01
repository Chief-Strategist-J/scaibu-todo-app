import 'package:todo_app/core/app_library.dart';

/// Doc Required
class WebhookNotificationImpl
    extends WebhookNotificationRepository<NotificationEntity> {
  @override
  Future<void> configureWebhook(
    final String webhookId,
    final Map<String, dynamic> settings,
  ) {
    // TO-DO: implement configureWebhook
    throw UnimplementedError();
  }

  @override
  Future<NotificationEntity> getWebhookStatus(final String webhookId) {
    // TO-DO: implement getWebhookStatus
    throw UnimplementedError();
  }

  @override
  Future<List<NotificationEntity>> listConfiguredWebhooks() {
    // TO-DO: implement listConfiguredWebhooks
    throw UnimplementedError();
  }

  @override
  Future<void> retryWebhookNotification(final String webhookId) {
    // TO-DO: implement retryWebhookNotification
    throw UnimplementedError();
  }

  @override
  Future<void> sendWebhookNotification(
    final String url,
    final Map<String, dynamic> payload,
  ) {
    // TO-DO: implement sendWebhookNotification
    throw UnimplementedError();
  }

  @override
  Future<void> triggerWebhookNotification(
    final String url,
    final Map<String, dynamic> data,
  ) {
    // TO-DO: implement triggerWebhookNotification
    throw UnimplementedError();
  }
}
