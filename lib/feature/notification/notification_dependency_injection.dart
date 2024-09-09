import 'package:todo_app/core/app_library.dart';

class NotificationDependencyInjection {
  static const notificationRepositoryImpl = 'notification_repository_impl';
  static const notificationAnalyticsRepositoryImpl = 'notification_analytics_repository_impl';

  static const categorizeNotificationUseCase = 'categorize_notification_use_case';
  static const configureNotificationSettingsUseCase = 'configure_notification_settings_use_case';
  static const enableDoNotDisturbUseCase = 'enable_do_not_disturb_use_case';
  static const encryptNotificationUseCase = 'encrypt_notification_use_case';
  static const ensureGDPRComplianceUseCase = 'ensure_gdpr_compliance_use_case';
  static const fetchNotificationHistoryUseCase = 'fetch_notification_history_use_case';
  static const getUnreadNotificationsUseCase = 'get_unread_notifications_use_case';
  static const integrateThirdPartyServiceUseCase = 'integrate_third_party_service_use_case';
  static const markNotificationAsReadUseCase = 'mark_notification_as_read_use_case';
  static const queueNotificationUseCase = 'queue_notification_use_case';
  static const retryNotificationDeliveryUseCase = 'retry_notification_delivery_use_case';
  static const sendBatchNotificationUseCase = 'send_batch_notification_use_case';
  static const sendInAppNotificationUseCase = 'send_in_app_notification_use_case';
  static const sendMultichannelNotificationUseCase = 'send_multichannel_notification_use_case';
  static const sendPersonalizedNotificationUseCase = 'send_personalized_notification_use_case';
  static const sendRealTimeNotificationUseCase = 'send_real_time_notification_use_case';
  static const setNotificationFrequencyUseCase = 'set_notification_frequency_use_case';
  static const trackNotificationDeliveryUseCase = 'track_notification_delivery_use_case';
  static const trackNotificationOpenRateUseCase = 'track_notification_open_rate_use_case';

  static void setupDependencyInjection() {
    getIt.registerSingleton<NotificationRepository<NotificationEntity>>(
      instanceName: notificationRepositoryImpl,
      NotificationImpl(),
    );

    getIt.registerSingleton<NotificationAnalyticsRepository<NotificationEntity>>(
      instanceName: notificationAnalyticsRepositoryImpl,
      NotificationAnalyticsImpl(),
    );

    getIt.registerSingleton<CategorizeNotificationUseCase>(
      instanceName: categorizeNotificationUseCase,
      CategorizeNotificationUseCase(
        notificationRepository: getIt<NotificationRepository<NotificationEntity>>(
          instanceName: notificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<ConfigureNotificationSettingsUseCase>(
      instanceName: configureNotificationSettingsUseCase,
      ConfigureNotificationSettingsUseCase(
        notificationRepository: getIt<NotificationRepository<NotificationEntity>>(
          instanceName: notificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<EnableDoNotDisturbUseCase>(
      instanceName: enableDoNotDisturbUseCase,
      EnableDoNotDisturbUseCase(
        notificationRepository: getIt<NotificationRepository<NotificationEntity>>(
          instanceName: enableDoNotDisturbUseCase,
        ),
      ),
    );

    getIt.registerSingleton<EncryptNotificationUseCase>(
      instanceName: encryptNotificationUseCase,
      EncryptNotificationUseCase(
        notificationRepository: getIt<NotificationRepository<NotificationEntity>>(
          instanceName: notificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<EnsureGDPRComplianceUseCase>(
      instanceName: ensureGDPRComplianceUseCase,
      EnsureGDPRComplianceUseCase(
        notificationRepository: getIt<NotificationRepository<NotificationEntity>>(
          instanceName: notificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<FetchNotificationHistoryUseCase>(
      instanceName: fetchNotificationHistoryUseCase,
      FetchNotificationHistoryUseCase(
        notificationRepository: getIt<NotificationRepository<NotificationEntity>>(
          instanceName: notificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<GetUnreadNotificationsUseCase>(
      instanceName: getUnreadNotificationsUseCase,
      GetUnreadNotificationsUseCase(
        notificationRepository: getIt<NotificationRepository<NotificationEntity>>(
          instanceName: notificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<IntegrateThirdPartyServiceUseCase>(
      instanceName: integrateThirdPartyServiceUseCase,
      IntegrateThirdPartyServiceUseCase(
        notificationRepository: getIt<NotificationRepository<NotificationEntity>>(
          instanceName: notificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<MarkNotificationAsReadUseCase>(
      instanceName: markNotificationAsReadUseCase,
      MarkNotificationAsReadUseCase(
        notificationRepository: getIt<NotificationRepository<NotificationEntity>>(
          instanceName: notificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<QueueNotificationUseCase>(
      instanceName: queueNotificationUseCase,
      QueueNotificationUseCase(
        notificationRepository: getIt<NotificationRepository<NotificationEntity>>(
          instanceName: notificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<RetryNotificationDeliveryUseCase>(
      instanceName: retryNotificationDeliveryUseCase,
      RetryNotificationDeliveryUseCase(
        notificationRepository: getIt<NotificationRepository<NotificationEntity>>(
          instanceName: notificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<SendBatchNotificationUseCase>(
      instanceName: sendBatchNotificationUseCase,
      SendBatchNotificationUseCase(
        notificationRepository: getIt<NotificationRepository<NotificationEntity>>(
          instanceName: notificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<SendInAppNotificationUseCase>(
      instanceName: sendInAppNotificationUseCase,
      SendInAppNotificationUseCase(
        notificationRepository: getIt<NotificationRepository<NotificationEntity>>(
          instanceName: notificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<SendMultichannelNotificationUseCase>(
      instanceName: sendMultichannelNotificationUseCase,
      SendMultichannelNotificationUseCase(
        notificationRepository: getIt<NotificationRepository<NotificationEntity>>(
          instanceName: notificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<SendPersonalizedNotificationUseCase>(
      instanceName: sendPersonalizedNotificationUseCase,
      SendPersonalizedNotificationUseCase(
        notificationRepository: getIt<NotificationRepository<NotificationEntity>>(
          instanceName: notificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<SendRealTimeNotificationUseCase>(
      instanceName: sendRealTimeNotificationUseCase,
      SendRealTimeNotificationUseCase(
        notificationRepository: getIt<NotificationRepository<NotificationEntity>>(
          instanceName: notificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<SetNotificationFrequencyUseCase>(
      instanceName: setNotificationFrequencyUseCase,
      SetNotificationFrequencyUseCase(
        notificationRepository: getIt<NotificationRepository<NotificationEntity>>(
          instanceName: notificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<TrackNotificationDeliveryUseCase>(
      instanceName: trackNotificationDeliveryUseCase,
      TrackNotificationDeliveryUseCase(
        notificationRepository: getIt<NotificationAnalyticsRepository<NotificationEntity>>(
          instanceName: notificationAnalyticsRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<TrackNotificationOpenRateUseCase>(
      instanceName: trackNotificationOpenRateUseCase,
      TrackNotificationOpenRateUseCase(
        notificationRepository: getIt<NotificationAnalyticsRepository<NotificationEntity>>(
          instanceName: notificationAnalyticsRepositoryImpl,
        ),
      ),
    );
  }

  static void disposeDependencyInjection() {
    getIt.unregister<NotificationRepository<NotificationEntity>>(instanceName: notificationRepositoryImpl);
    getIt.unregister<NotificationAnalyticsRepository<NotificationEntity>>(instanceName: notificationAnalyticsRepositoryImpl);

    getIt.unregister<CategorizeNotificationUseCase>(instanceName: categorizeNotificationUseCase);
    getIt.unregister<ConfigureNotificationSettingsUseCase>(instanceName: configureNotificationSettingsUseCase);
    getIt.unregister<EnableDoNotDisturbUseCase>(instanceName: enableDoNotDisturbUseCase);
    getIt.unregister<EncryptNotificationUseCase>(instanceName: encryptNotificationUseCase);
    getIt.unregister<EnsureGDPRComplianceUseCase>(instanceName: ensureGDPRComplianceUseCase);
    getIt.unregister<FetchNotificationHistoryUseCase>(instanceName: fetchNotificationHistoryUseCase);
    getIt.unregister<GetUnreadNotificationsUseCase>(instanceName: getUnreadNotificationsUseCase);
    getIt.unregister<IntegrateThirdPartyServiceUseCase>(instanceName: integrateThirdPartyServiceUseCase);
    getIt.unregister<MarkNotificationAsReadUseCase>(instanceName: markNotificationAsReadUseCase);
    getIt.unregister<QueueNotificationUseCase>(instanceName: queueNotificationUseCase);
    getIt.unregister<RetryNotificationDeliveryUseCase>(instanceName: retryNotificationDeliveryUseCase);
    getIt.unregister<SendBatchNotificationUseCase>(instanceName: sendBatchNotificationUseCase);
    getIt.unregister<SendInAppNotificationUseCase>(instanceName: sendInAppNotificationUseCase);
    getIt.unregister<SendMultichannelNotificationUseCase>(instanceName: sendMultichannelNotificationUseCase);
    getIt.unregister<SendPersonalizedNotificationUseCase>(instanceName: sendPersonalizedNotificationUseCase);
    getIt.unregister<SendRealTimeNotificationUseCase>(instanceName: sendRealTimeNotificationUseCase);
    getIt.unregister<SetNotificationFrequencyUseCase>(instanceName: setNotificationFrequencyUseCase);
    getIt.unregister<TrackNotificationDeliveryUseCase>(instanceName: trackNotificationDeliveryUseCase);
    getIt.unregister<TrackNotificationOpenRateUseCase>(instanceName: trackNotificationOpenRateUseCase);
  }
}

class NotificationAnalyticsDependencyInjection {
  static const notificationAnalyticsRepositoryImpl = 'notification_analytics_repository_impl';
  static const getHistoricalNotificationDataUseCase = 'get_historical_notification_data_use_case';
  static const getNotificationEngagementReportUseCase = 'get_notification_engagement_report_use_case';
  static const getNotificationStatisticsUseCase = 'get_notification_statistics_use_case';
  static const trackNotificationDeliveryUseCase = 'track_notification_delivery_use_case';
  static const trackNotificationOpenRateUseCase = 'track_notification_open_rate_use_case';

  static void setupDependencyInjection() {
    getIt.registerSingleton<NotificationAnalyticsRepository<NotificationEntity>>(
      NotificationAnalyticsImpl(),
      instanceName: notificationAnalyticsRepositoryImpl,
    );

    getIt.registerSingleton<GetHistoricalNotificationDataUseCase>(
      instanceName: getHistoricalNotificationDataUseCase,
      GetHistoricalNotificationDataUseCase(
        notificationAnalyticsRepository: getIt<NotificationAnalyticsRepository<NotificationEntity>>(
          instanceName: notificationAnalyticsRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<GetNotificationEngagementReportUseCase>(
      instanceName: getNotificationEngagementReportUseCase,
      GetNotificationEngagementReportUseCase(
        notificationAnalyticsRepository: getIt<NotificationAnalyticsRepository<NotificationEntity>>(
          instanceName: notificationAnalyticsRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<GetNotificationStatisticsUseCase>(
      instanceName: getNotificationStatisticsUseCase,
      GetNotificationStatisticsUseCase(
        notificationAnalyticsRepository: getIt<NotificationAnalyticsRepository<NotificationEntity>>(
          instanceName: notificationAnalyticsRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<TrackNotificationDeliveryUseCase>(
      instanceName: trackNotificationDeliveryUseCase,
      TrackNotificationDeliveryUseCase(
        notificationRepository: getIt<NotificationAnalyticsRepository<NotificationEntity>>(
          instanceName: notificationAnalyticsRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<TrackNotificationOpenRateUseCase>(
      instanceName: trackNotificationOpenRateUseCase,
      TrackNotificationOpenRateUseCase(
        notificationRepository: getIt<NotificationAnalyticsRepository<NotificationEntity>>(
          instanceName: notificationAnalyticsRepositoryImpl,
        ),
      ),
    );
  }

  static void disposeDependencyInjection() {
    getIt.unregister<NotificationAnalyticsRepository<NotificationEntity>>(instanceName: notificationAnalyticsRepositoryImpl);
    getIt.unregister<GetHistoricalNotificationDataUseCase>(instanceName: getHistoricalNotificationDataUseCase);
    getIt.unregister<GetNotificationEngagementReportUseCase>(instanceName: getNotificationEngagementReportUseCase);
    getIt.unregister<GetNotificationStatisticsUseCase>(instanceName: getNotificationStatisticsUseCase);
    getIt.unregister<TrackNotificationDeliveryUseCase>(instanceName: trackNotificationDeliveryUseCase);
    getIt.unregister<TrackNotificationOpenRateUseCase>(instanceName: trackNotificationOpenRateUseCase);
  }
}

class NotificationEmailDependencyInjection {
  static const emailNotificationRepositoryImpl = 'email_notification_repository_impl';
  static const sendEmailUseCase = 'send_email_use_case';
  static const scheduleEmailUseCase = 'schedule_email_use_case';
  static const getEmailStatusUseCase = 'get_email_status_use_case';
  static const getEmailHistoryUseCase = 'get_email_history_use_case';
  static const cancelScheduledEmailUseCase = 'cancel_scheduled_email_use_case';

  static void setupDependencyInjection() {
    getIt.registerSingleton<EmailNotificationRepository<NotificationEntity>>(
      EmailNotificationImpl(),
      instanceName: NotificationEmailDependencyInjection.emailNotificationRepositoryImpl,
    );

    getIt.registerSingleton<SendEmailUseCase>(
      instanceName: sendEmailUseCase,
      SendEmailUseCase(
        emailNotificationRepository: getIt<EmailNotificationRepository<NotificationEntity>>(
          instanceName: NotificationEmailDependencyInjection.emailNotificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<ScheduleEmailUseCase>(
      instanceName: scheduleEmailUseCase,
      ScheduleEmailUseCase(
        emailNotificationRepository: getIt<EmailNotificationRepository<NotificationEntity>>(
          instanceName: NotificationEmailDependencyInjection.emailNotificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<GetEmailStatusUseCase>(
      instanceName: getEmailStatusUseCase,
      GetEmailStatusUseCase(
        emailNotificationRepository: getIt<EmailNotificationRepository<NotificationEntity>>(
          instanceName: NotificationEmailDependencyInjection.emailNotificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<GetEmailHistoryUseCase<NotificationEntity>>(
      instanceName: getEmailHistoryUseCase,
      GetEmailHistoryUseCase<NotificationEntity>(
        emailNotificationRepository: getIt<EmailNotificationRepository<NotificationEntity>>(
          instanceName: NotificationEmailDependencyInjection.emailNotificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<CancelScheduledEmailUseCase>(
      instanceName: cancelScheduledEmailUseCase,
      CancelScheduledEmailUseCase(
        emailNotificationRepository: getIt<EmailNotificationRepository<NotificationEntity>>(
          instanceName: NotificationEmailDependencyInjection.emailNotificationRepositoryImpl,
        ),
      ),
    );
  }

  static void disposeDependencyInjection() {
    getIt.unregister<SendEmailUseCase>(instanceName: sendEmailUseCase);
    getIt.unregister<ScheduleEmailUseCase>(instanceName: scheduleEmailUseCase);
    getIt.unregister<GetEmailStatusUseCase>(instanceName: getEmailStatusUseCase);
    getIt.unregister<GetEmailHistoryUseCase<NotificationEntity>>(instanceName: getEmailHistoryUseCase);
    getIt.unregister<CancelScheduledEmailUseCase>(instanceName: cancelScheduledEmailUseCase);
  }
}

class NotificationPushDependencyInjection {
  static const pushNotificationRepositoryImpl = 'push_notification_repository_impl';

  static const sendPushNotificationUseCase = 'send_push_notification_use_case';
  static const schedulePushNotificationUseCase = 'schedule_push_notification_use_case';
  static const getPushNotificationStatusUseCase = 'get_push_notification_status_use_case';
  static const getPushNotificationHistoryUseCase = 'get_push_notification_history_use_case';
  static const cancelScheduledPushNotificationUseCase = 'cancel_scheduled_push_notification_use_case';

  static void setupDependencyInjection() {
    getIt.registerSingleton<PushNotificationRepository<NotificationEntity>>(
      PushNotificationImpl(),
      instanceName: pushNotificationRepositoryImpl,
    );

    // Register use case
    getIt.registerSingleton<SendPushNotificationUseCase>(
      instanceName: sendPushNotificationUseCase,
      SendPushNotificationUseCase(
        pushNotificationRepository: getIt<PushNotificationRepository<NotificationEntity>>(
          instanceName: pushNotificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<SchedulePushNotificationUseCase>(
      instanceName: schedulePushNotificationUseCase,
      SchedulePushNotificationUseCase(
        pushNotificationRepository: getIt<PushNotificationRepository<NotificationEntity>>(
          instanceName: pushNotificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<GetPushNotificationStatusUseCase>(
      instanceName: getPushNotificationStatusUseCase,
      GetPushNotificationStatusUseCase(
        pushNotificationRepository: getIt<PushNotificationRepository<NotificationEntity>>(
          instanceName: pushNotificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<GetPushNotificationHistoryUseCase>(
      instanceName: getPushNotificationHistoryUseCase,
      GetPushNotificationHistoryUseCase(
        pushNotificationRepository: getIt<PushNotificationRepository<NotificationEntity>>(
          instanceName: pushNotificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<CancelScheduledPushNotificationUseCase>(
      instanceName: cancelScheduledPushNotificationUseCase,
      CancelScheduledPushNotificationUseCase(
        pushNotificationRepository: getIt<PushNotificationRepository<NotificationEntity>>(
          instanceName: pushNotificationRepositoryImpl,
        ),
      ),
    );
  }

  static void disposeDependencyInjection() {
    getIt.unregister<PushNotificationRepository<NotificationEntity>>(instanceName: pushNotificationRepositoryImpl);
    getIt.unregister<SendPushNotificationUseCase>(instanceName: sendPushNotificationUseCase);
    getIt.unregister<SchedulePushNotificationUseCase>(instanceName: schedulePushNotificationUseCase);
    getIt.unregister<GetPushNotificationStatusUseCase>(instanceName: getPushNotificationStatusUseCase);
    getIt.unregister<GetPushNotificationHistoryUseCase>(instanceName: getPushNotificationHistoryUseCase);
    getIt.unregister<CancelScheduledPushNotificationUseCase>(instanceName: cancelScheduledPushNotificationUseCase);
  }
}

class NotificationSMSDependencyInjection {
  static const smsNotificationRepositoryImpl = 'sms_notification_repository_impl';

  static const sendSMSUseCase = 'send_sms_use_case';
  static const scheduleSMSUseCase = 'schedule_sms_use_case';
  static const getSMSStatusUseCase = 'get_sms_status_use_case';
  static const getSMSHistoryUseCase = 'get_sms_history_use_case';
  static const cancelScheduledSMSUseCase = 'cancel_scheduled_sms_use_case';

  // Register dependencies
  static void setupDependencyInjection() {
    getIt.registerSingleton<SMSNotificationRepository<NotificationEntity>>(
      SmsNotificationImpl(),
      instanceName: smsNotificationRepositoryImpl,
    );

    getIt.registerSingleton<SendSMSUseCase>(
      instanceName: sendSMSUseCase,
      SendSMSUseCase(
        smsNotificationRepository: getIt<SMSNotificationRepository<NotificationEntity>>(
          instanceName: smsNotificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<ScheduleSMSUseCase>(
      instanceName: scheduleSMSUseCase,
      ScheduleSMSUseCase(
        smsNotificationRepository: getIt<SMSNotificationRepository<NotificationEntity>>(
          instanceName: smsNotificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<GetSMSStatusUseCase>(
      instanceName: getSMSStatusUseCase,
      GetSMSStatusUseCase(
        smsNotificationRepository: getIt<SMSNotificationRepository<NotificationEntity>>(
          instanceName: smsNotificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<GetSMSHistoryUseCase>(
      instanceName: getSMSHistoryUseCase,
      GetSMSHistoryUseCase(
        smsNotificationRepository: getIt<SMSNotificationRepository<NotificationEntity>>(
          instanceName: smsNotificationRepositoryImpl,
        ),
      ),
    );
    getIt.registerSingleton<CancelScheduledSMSUseCase>(
      instanceName: cancelScheduledSMSUseCase,
      CancelScheduledSMSUseCase(
        smsNotificationRepository: getIt<SMSNotificationRepository<NotificationEntity>>(
          instanceName: smsNotificationRepositoryImpl,
        ),
      ),
    );
  }

  static void disposeDependencyInjection() {
    getIt.unregister<SMSNotificationRepository<NotificationEntity>>(instanceName: smsNotificationRepositoryImpl);
    getIt.unregister<SendSMSUseCase>(instanceName: sendSMSUseCase);
    getIt.unregister<ScheduleSMSUseCase>(instanceName: scheduleSMSUseCase);
    getIt.unregister<GetSMSStatusUseCase>(instanceName: getSMSStatusUseCase);
    getIt.unregister<GetSMSHistoryUseCase>(instanceName: getSMSHistoryUseCase);
    getIt.unregister<CancelScheduledSMSUseCase>(instanceName: cancelScheduledSMSUseCase);
  }
}

class NotificationWebhookDependencyInjection {
  static const webhookNotificationRepositoryImpl = 'webhook_notification_repository_impl';
  static const configureWebhookUseCase = 'configure_webhook_use_case';
  static const getWebhookStatusUseCase = 'get_webhook_status_use_case';
  static const listConfiguredWebhooksUseCase = 'list_configured_webhooks_use_case';
  static const retryWebhookNotificationUseCase = 'retry_webhook_notification_use_case';
  static const sendWebhookNotificationUseCase = 'send_webhook_notification_use_case';
  static const triggerWebhookNotificationUseCase = 'trigger_webhook_notification_use_case';

  static void setupDependencyInjection() {
    getIt.registerSingleton<WebhookNotificationRepository<NotificationEntity>>(
      WebhookNotificationImpl(),
      instanceName: webhookNotificationRepositoryImpl,
    );

    getIt.registerSingleton<ConfigureWebhookUseCase>(
      instanceName: configureWebhookUseCase,
      ConfigureWebhookUseCase(
        webhookNotificationRepository: getIt<WebhookNotificationRepository<NotificationEntity>>(
          instanceName: webhookNotificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<GetWebhookStatusUseCase>(
      instanceName: getWebhookStatusUseCase,
      GetWebhookStatusUseCase(
        webhookNotificationRepository: getIt<WebhookNotificationRepository<NotificationEntity>>(
          instanceName: webhookNotificationRepositoryImpl,
        ),
      ),
    );
    getIt.registerSingleton<ListConfiguredWebhooksUseCase>(
      instanceName: listConfiguredWebhooksUseCase,
      ListConfiguredWebhooksUseCase(
        webhookNotificationRepository: getIt<WebhookNotificationRepository<NotificationEntity>>(
          instanceName: webhookNotificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<RetryWebhookNotificationUseCase>(
      instanceName: retryWebhookNotificationUseCase,
      RetryWebhookNotificationUseCase(
        webhookNotificationRepository: getIt<WebhookNotificationRepository<NotificationEntity>>(
          instanceName: webhookNotificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<SendWebhookNotificationUseCase>(
      instanceName: sendWebhookNotificationUseCase,
      SendWebhookNotificationUseCase(
        webhookNotificationRepository: getIt<WebhookNotificationRepository<NotificationEntity>>(
          instanceName: webhookNotificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<TriggerWebhookNotificationUseCase>(
      instanceName: triggerWebhookNotificationUseCase,
      TriggerWebhookNotificationUseCase(
        webhookNotificationRepository: getIt<WebhookNotificationRepository<NotificationEntity>>(
          instanceName: webhookNotificationRepositoryImpl,
        ),
      ),
    );
  }

  static void disposeDependencyInjection() {
    getIt.unregister<WebhookNotificationRepository<NotificationEntity>>(instanceName: webhookNotificationRepositoryImpl);
    getIt.unregister<ConfigureWebhookUseCase>(instanceName: configureWebhookUseCase);
    getIt.unregister<GetWebhookStatusUseCase>(instanceName: getWebhookStatusUseCase);
    getIt.unregister<ListConfiguredWebhooksUseCase>(instanceName: listConfiguredWebhooksUseCase);
    getIt.unregister<RetryWebhookNotificationUseCase>(instanceName: retryWebhookNotificationUseCase);
    getIt.unregister<SendWebhookNotificationUseCase>(instanceName: sendWebhookNotificationUseCase);
    getIt.unregister<TriggerWebhookNotificationUseCase>(instanceName: triggerWebhookNotificationUseCase);
  }
}
