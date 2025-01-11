abstract class WebhookNotificationRepository<T> {
  // Send a webhook notification
  Future<void> sendWebhookNotification(
      final String url, final Map<String, dynamic> payload);

  // Configure webhook settings
  Future<void> configureWebhook(
      final String webhookId, final Map<String, dynamic> settings);

  // Get webhook notification status
  Future<T> getWebhookStatus(final String webhookId);

  // Retry sending a webhook notification
  Future<void> retryWebhookNotification(final String webhookId);

  // List all configured webhooks
  Future<List<T>> listConfiguredWebhooks();

  // Trigger a webhook notification
  Future<void> triggerWebhookNotification(
      final String url, final Map<String, dynamic> data);
}
