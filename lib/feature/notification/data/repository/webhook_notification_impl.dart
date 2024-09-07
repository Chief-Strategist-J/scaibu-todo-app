import 'package:todo_app/core/app_library.dart';

class WebhookNotificationImpl extends WebhookNotificationRepository{
  @override
  Future<void> configureWebhook(String webhookId, Map<String, dynamic> settings) {
    // TODO: implement configureWebhook
    throw UnimplementedError();
  }

  @override
  Future getWebhookStatus(String webhookId) {
    // TODO: implement getWebhookStatus
    throw UnimplementedError();
  }

  @override
  Future<List> listConfiguredWebhooks() {
    // TODO: implement listConfiguredWebhooks
    throw UnimplementedError();
  }

  @override
  Future<void> retryWebhookNotification(String webhookId) {
    // TODO: implement retryWebhookNotification
    throw UnimplementedError();
  }

  @override
  Future<void> sendWebhookNotification(String url, Map<String, dynamic> payload) {
    // TODO: implement sendWebhookNotification
    throw UnimplementedError();
  }

  @override
  Future<void> triggerWebhookNotification(String url, Map<String, dynamic> data) {
    // TODO: implement triggerWebhookNotification
    throw UnimplementedError();
  }
}