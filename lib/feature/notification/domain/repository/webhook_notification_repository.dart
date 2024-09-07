abstract class WebhookNotificationRepository<T> {
  // Send a webhook notification
  Future<void> sendWebhookNotification(String url, Map<String, dynamic> payload);

  // Configure webhook settings
  Future<void> configureWebhook(String webhookId, Map<String, dynamic> settings);

  // Get webhook notification status
  Future<T> getWebhookStatus(String webhookId);

  // Retry sending a webhook notification
  Future<void> retryWebhookNotification(String webhookId);

  // List all configured webhooks
  Future<List<T>> listConfiguredWebhooks();

  // Trigger a webhook notification
  Future<void> triggerWebhookNotification(String url, Map<String, dynamic> data);
}
