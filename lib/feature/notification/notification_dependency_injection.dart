import 'package:todo_app/core/app_library.dart';

class NotificationDependencyInjection {
  static const String notificationRepositoryImpl =
      'notification_repository_impl';
  static const String notificationAnalyticsRepositoryImpl =
      'notification_analytics_repository_impl_v1';

  static const String categorizeNotificationUseCase =
      'categorize_notification_use_case';
  static const String configureNotificationSettingsUseCase =
      'configure_notification_settings_use_case';
  static const String enableDoNotDisturbUseCase =
      'enable_do_not_disturb_use_case';
  static const String encryptNotificationUseCase =
      'encrypt_notification_use_case';
  static const String ensureGDPRComplianceUseCase =
      'ensure_gdpr_compliance_use_case';
  static const String fetchNotificationHistoryUseCase =
      'fetch_notification_history_use_case';
  static const String getUnreadNotificationsUseCase =
      'get_unread_notifications_use_case';
  static const String integrateThirdPartyServiceUseCase =
      'integrate_third_party_service_use_case';
  static const String markNotificationAsReadUseCase =
      'mark_notification_as_read_use_case';
  static const String queueNotificationUseCase = 'queue_notification_use_case';
  static const String retryNotificationDeliveryUseCase =
      'retry_notification_delivery_use_case';
  static const String sendBatchNotificationUseCase =
      'send_batch_notification_use_case';
  static const String sendInAppNotificationUseCase =
      'send_in_app_notification_use_case';
  static const String sendMultichannelNotificationUseCase =
      'send_multichannel_notification_use_case';
  static const String sendPersonalizedNotificationUseCase =
      'send_personalized_notification_use_case';
  static const String sendRealTimeNotificationUseCase =
      'send_real_time_notification_use_case';
  static const String setNotificationFrequencyUseCase =
      'set_notification_frequency_use_case';
  static const String trackNotificationDeliveryUseCase =
      'track_notification_delivery_use_case';
  static const String trackNotificationOpenRateUseCase =
      'track_notification_open_rate_use_case';

  static const String notificationBloc = 'notificationBloc';

  static void setupDependencyInjection() {
    getIt
      ..registerSingleton<NotificationRepository<NotificationEntity>>(
        instanceName: notificationRepositoryImpl,
        NotificationImpl(),
      )
      ..registerSingleton<NotificationAnalyticsRepository<NotificationEntity>>(
        instanceName: notificationAnalyticsRepositoryImpl,
        NotificationAnalyticsImpl(),
      )
      ..registerSingleton<CategorizeNotificationUseCase>(
        instanceName: categorizeNotificationUseCase,
        CategorizeNotificationUseCase(
          notificationRepository:
              getIt<NotificationRepository<NotificationEntity>>(
            instanceName: notificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<ConfigureNotificationSettingsUseCase>(
        instanceName: configureNotificationSettingsUseCase,
        ConfigureNotificationSettingsUseCase(
          notificationRepository:
              getIt<NotificationRepository<NotificationEntity>>(
            instanceName: notificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<EnableDoNotDisturbUseCase>(
        instanceName: enableDoNotDisturbUseCase,
        EnableDoNotDisturbUseCase(
          notificationRepository:
              getIt<NotificationRepository<NotificationEntity>>(
            instanceName: notificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<EncryptNotificationUseCase>(
        instanceName: encryptNotificationUseCase,
        EncryptNotificationUseCase(
          notificationRepository:
              getIt<NotificationRepository<NotificationEntity>>(
            instanceName: notificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<EnsureGDPRComplianceUseCase>(
        instanceName: ensureGDPRComplianceUseCase,
        EnsureGDPRComplianceUseCase(
          notificationRepository:
              getIt<NotificationRepository<NotificationEntity>>(
            instanceName: notificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<FetchNotificationHistoryUseCase>(
        instanceName: fetchNotificationHistoryUseCase,
        FetchNotificationHistoryUseCase(
          notificationRepository:
              getIt<NotificationRepository<NotificationEntity>>(
            instanceName: notificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<GetUnreadNotificationsUseCase>(
        instanceName: getUnreadNotificationsUseCase,
        GetUnreadNotificationsUseCase(
          notificationRepository:
              getIt<NotificationRepository<NotificationEntity>>(
            instanceName: notificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<IntegrateThirdPartyServiceUseCase>(
        instanceName: integrateThirdPartyServiceUseCase,
        IntegrateThirdPartyServiceUseCase(
          notificationRepository:
              getIt<NotificationRepository<NotificationEntity>>(
            instanceName: notificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<MarkNotificationAsReadUseCase>(
        instanceName: markNotificationAsReadUseCase,
        MarkNotificationAsReadUseCase(
          notificationRepository:
              getIt<NotificationRepository<NotificationEntity>>(
            instanceName: notificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<QueueNotificationUseCase>(
        instanceName: queueNotificationUseCase,
        QueueNotificationUseCase(
          notificationRepository:
              getIt<NotificationRepository<NotificationEntity>>(
            instanceName: notificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<RetryNotificationDeliveryUseCase>(
        instanceName: retryNotificationDeliveryUseCase,
        RetryNotificationDeliveryUseCase(
          notificationRepository:
              getIt<NotificationRepository<NotificationEntity>>(
            instanceName: notificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<SendBatchNotificationUseCase>(
        instanceName: sendBatchNotificationUseCase,
        SendBatchNotificationUseCase(
          notificationRepository:
              getIt<NotificationRepository<NotificationEntity>>(
            instanceName: notificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<SendInAppNotificationUseCase>(
        instanceName: sendInAppNotificationUseCase,
        SendInAppNotificationUseCase(
          notificationRepository:
              getIt<NotificationRepository<NotificationEntity>>(
            instanceName: notificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<SendMultichannelNotificationUseCase>(
        instanceName: sendMultichannelNotificationUseCase,
        SendMultichannelNotificationUseCase(
          notificationRepository:
              getIt<NotificationRepository<NotificationEntity>>(
            instanceName: notificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<SendPersonalizedNotificationUseCase>(
        instanceName: sendPersonalizedNotificationUseCase,
        SendPersonalizedNotificationUseCase(
          notificationRepository:
              getIt<NotificationRepository<NotificationEntity>>(
            instanceName: notificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<SendRealTimeNotificationUseCase>(
        instanceName: sendRealTimeNotificationUseCase,
        SendRealTimeNotificationUseCase(
          notificationRepository:
              getIt<NotificationRepository<NotificationEntity>>(
            instanceName: notificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<SetNotificationFrequencyUseCase>(
        instanceName: setNotificationFrequencyUseCase,
        SetNotificationFrequencyUseCase(
          notificationRepository:
              getIt<NotificationRepository<NotificationEntity>>(
            instanceName: notificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<TrackNotificationDeliveryUseCase>(
        instanceName: trackNotificationDeliveryUseCase,
        TrackNotificationDeliveryUseCase(
          notificationRepository:
              getIt<NotificationAnalyticsRepository<NotificationEntity>>(
            instanceName: notificationAnalyticsRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<TrackNotificationOpenRateUseCase>(
        instanceName: trackNotificationOpenRateUseCase,
        TrackNotificationOpenRateUseCase(
          notificationRepository:
              getIt<NotificationAnalyticsRepository<NotificationEntity>>(
            instanceName: notificationAnalyticsRepositoryImpl,
          ),
        ),
      )
      ..registerFactory<NotificationBloc>(
        instanceName:
            notificationBloc, // You can define a constant for the instance name if needed
        () => NotificationBloc(),
      );
  }

  static Future<void> disposeDependencyInjection() async {
    getIt
      ..unregister<NotificationRepository<NotificationEntity>>(
          instanceName: notificationRepositoryImpl)
      ..unregister<NotificationAnalyticsRepository<NotificationEntity>>(
          instanceName: notificationAnalyticsRepositoryImpl)
      ..unregister<CategorizeNotificationUseCase>(
          instanceName: categorizeNotificationUseCase)
      ..unregister<ConfigureNotificationSettingsUseCase>(
          instanceName: configureNotificationSettingsUseCase)
      ..unregister<EnableDoNotDisturbUseCase>(
          instanceName: enableDoNotDisturbUseCase)
      ..unregister<EncryptNotificationUseCase>(
          instanceName: encryptNotificationUseCase)
      ..unregister<EnsureGDPRComplianceUseCase>(
          instanceName: ensureGDPRComplianceUseCase)
      ..unregister<FetchNotificationHistoryUseCase>(
          instanceName: fetchNotificationHistoryUseCase)
      ..unregister<GetUnreadNotificationsUseCase>(
          instanceName: getUnreadNotificationsUseCase)
      ..unregister<IntegrateThirdPartyServiceUseCase>(
          instanceName: integrateThirdPartyServiceUseCase)
      ..unregister<MarkNotificationAsReadUseCase>(
          instanceName: markNotificationAsReadUseCase)
      ..unregister<QueueNotificationUseCase>(
          instanceName: queueNotificationUseCase)
      ..unregister<RetryNotificationDeliveryUseCase>(
          instanceName: retryNotificationDeliveryUseCase)
      ..unregister<SendBatchNotificationUseCase>(
          instanceName: sendBatchNotificationUseCase)
      ..unregister<SendInAppNotificationUseCase>(
          instanceName: sendInAppNotificationUseCase)
      ..unregister<SendMultichannelNotificationUseCase>(
          instanceName: sendMultichannelNotificationUseCase)
      ..unregister<SendPersonalizedNotificationUseCase>(
          instanceName: sendPersonalizedNotificationUseCase)
      ..unregister<SendRealTimeNotificationUseCase>(
          instanceName: sendRealTimeNotificationUseCase)
      ..unregister<SetNotificationFrequencyUseCase>(
          instanceName: setNotificationFrequencyUseCase)
      ..unregister<TrackNotificationDeliveryUseCase>(
          instanceName: trackNotificationDeliveryUseCase)
      ..unregister<TrackNotificationOpenRateUseCase>(
          instanceName: trackNotificationOpenRateUseCase)
      ..unregister<NotificationBloc>(
          instanceName: NotificationDependencyInjection.notificationBloc);
  }
}

class NotificationAnalyticsDependencyInjection {
  static const String notificationAnalyticsRepositoryImpl =
      'notification_analytics_repository_impl_v2';
  static const String getHistoricalNotificationDataUseCase =
      'get_historical_notification_data_use_case';
  static const String getNotificationEngagementReportUseCase =
      'get_notification_engagement_report_use_case';
  static const String getNotificationStatisticsUseCase =
      'get_notification_statistics_use_case';
  static const String trackNotificationDeliveryUseCase =
      'track_notification_delivery_use_case_v1';
  static const String trackNotificationOpenRateUseCase =
      'track_notification_open_rate_use_case_v1';

  static Future<void> setupDependencyInjection() async {
    getIt
      ..registerSingleton<NotificationAnalyticsRepository<NotificationEntity>>(
        NotificationAnalyticsImpl(),
        instanceName: notificationAnalyticsRepositoryImpl,
      )
      ..registerSingleton<GetHistoricalNotificationDataUseCase>(
        instanceName: getHistoricalNotificationDataUseCase,
        GetHistoricalNotificationDataUseCase(
          notificationAnalyticsRepository:
              getIt<NotificationAnalyticsRepository<NotificationEntity>>(
            instanceName: notificationAnalyticsRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<GetNotificationEngagementReportUseCase>(
        instanceName: getNotificationEngagementReportUseCase,
        GetNotificationEngagementReportUseCase(
          notificationAnalyticsRepository:
              getIt<NotificationAnalyticsRepository<NotificationEntity>>(
            instanceName: notificationAnalyticsRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<GetNotificationStatisticsUseCase>(
        instanceName: getNotificationStatisticsUseCase,
        GetNotificationStatisticsUseCase(
          notificationAnalyticsRepository:
              getIt<NotificationAnalyticsRepository<NotificationEntity>>(
            instanceName: notificationAnalyticsRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<TrackNotificationDeliveryUseCase>(
        instanceName: trackNotificationDeliveryUseCase,
        TrackNotificationDeliveryUseCase(
          notificationRepository:
              getIt<NotificationAnalyticsRepository<NotificationEntity>>(
            instanceName: notificationAnalyticsRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<TrackNotificationOpenRateUseCase>(
        instanceName: trackNotificationOpenRateUseCase,
        TrackNotificationOpenRateUseCase(
          notificationRepository:
              getIt<NotificationAnalyticsRepository<NotificationEntity>>(
            instanceName: notificationAnalyticsRepositoryImpl,
          ),
        ),
      );
  }

  static Future<void> disposeDependencyInjection() async {
    getIt
      ..unregister<NotificationAnalyticsRepository<NotificationEntity>>(
          instanceName: notificationAnalyticsRepositoryImpl)
      ..unregister<GetHistoricalNotificationDataUseCase>(
          instanceName: getHistoricalNotificationDataUseCase)
      ..unregister<GetNotificationEngagementReportUseCase>(
          instanceName: getNotificationEngagementReportUseCase)
      ..unregister<GetNotificationStatisticsUseCase>(
          instanceName: getNotificationStatisticsUseCase)
      ..unregister<TrackNotificationDeliveryUseCase>(
          instanceName: trackNotificationDeliveryUseCase)
      ..unregister<TrackNotificationOpenRateUseCase>(
          instanceName: trackNotificationOpenRateUseCase);
  }
}

class NotificationEmailDependencyInjection {
  static const String emailNotificationRepositoryImpl =
      'email_notification_repository_impl';
  static const String sendEmailUseCase = 'send_email_use_case';
  static const String scheduleEmailUseCase = 'schedule_email_use_case';
  static const String getEmailStatusUseCase = 'get_email_status_use_case';
  static const String getEmailHistoryUseCase = 'get_email_history_use_case';
  static const String cancelScheduledEmailUseCase =
      'cancel_scheduled_email_use_case';

  static void setupDependencyInjection() {
    getIt
      ..registerSingleton<EmailNotificationRepository<NotificationEntity>>(
        EmailNotificationImpl(),
        instanceName: NotificationEmailDependencyInjection
            .emailNotificationRepositoryImpl,
      )
      ..registerSingleton<SendEmailUseCase>(
        instanceName: sendEmailUseCase,
        SendEmailUseCase(
          emailNotificationRepository:
              getIt<EmailNotificationRepository<NotificationEntity>>(
            instanceName: NotificationEmailDependencyInjection
                .emailNotificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<ScheduleEmailUseCase>(
        instanceName: scheduleEmailUseCase,
        ScheduleEmailUseCase(
          emailNotificationRepository:
              getIt<EmailNotificationRepository<NotificationEntity>>(
            instanceName: NotificationEmailDependencyInjection
                .emailNotificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<GetEmailStatusUseCase>(
        instanceName: getEmailStatusUseCase,
        GetEmailStatusUseCase(
          emailNotificationRepository:
              getIt<EmailNotificationRepository<NotificationEntity>>(
            instanceName: NotificationEmailDependencyInjection
                .emailNotificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<GetEmailHistoryUseCase<NotificationEntity>>(
        instanceName: getEmailHistoryUseCase,
        GetEmailHistoryUseCase<NotificationEntity>(
          emailNotificationRepository:
              getIt<EmailNotificationRepository<NotificationEntity>>(
            instanceName: NotificationEmailDependencyInjection
                .emailNotificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<CancelScheduledEmailUseCase>(
        instanceName: cancelScheduledEmailUseCase,
        CancelScheduledEmailUseCase(
          emailNotificationRepository:
              getIt<EmailNotificationRepository<NotificationEntity>>(
            instanceName: NotificationEmailDependencyInjection
                .emailNotificationRepositoryImpl,
          ),
        ),
      );
  }

  static Future<void> disposeDependencyInjection() async {
    getIt
      ..unregister<SendEmailUseCase>(instanceName: sendEmailUseCase)
      ..unregister<ScheduleEmailUseCase>(instanceName: scheduleEmailUseCase)
      ..unregister<GetEmailStatusUseCase>(instanceName: getEmailStatusUseCase)
      ..unregister<GetEmailHistoryUseCase<NotificationEntity>>(
          instanceName: getEmailHistoryUseCase)
      ..unregister<CancelScheduledEmailUseCase>(
          instanceName: cancelScheduledEmailUseCase);
  }
}

class NotificationPushDependencyInjection {
  static const String pushNotificationRepositoryImpl =
      'push_notification_repository_impl';

  static const String sendPushNotificationUseCase =
      'send_push_notification_use_case';
  static const String schedulePushNotificationUseCase =
      'schedule_push_notification_use_case';
  static const String getPushNotificationStatusUseCase =
      'get_push_notification_status_use_case';
  static const String getPushNotificationHistoryUseCase =
      'get_push_notification_history_use_case';
  static const String cancelScheduledPushNotificationUseCase =
      'cancel_scheduled_push_notification_use_case';

  static void setupDependencyInjection() {
    getIt
      ..registerSingleton<PushNotificationRepository<NotificationEntity>>(
        PushNotificationImpl(),
        instanceName: pushNotificationRepositoryImpl,
      )

      // Register use case
      ..registerSingleton<SendPushNotificationUseCase>(
        instanceName: sendPushNotificationUseCase,
        SendPushNotificationUseCase(
          pushNotificationRepository:
              getIt<PushNotificationRepository<NotificationEntity>>(
            instanceName: pushNotificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<SchedulePushNotificationUseCase>(
        instanceName: schedulePushNotificationUseCase,
        SchedulePushNotificationUseCase(
          pushNotificationRepository:
              getIt<PushNotificationRepository<NotificationEntity>>(
            instanceName: pushNotificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<GetPushNotificationStatusUseCase>(
        instanceName: getPushNotificationStatusUseCase,
        GetPushNotificationStatusUseCase(
          pushNotificationRepository:
              getIt<PushNotificationRepository<NotificationEntity>>(
            instanceName: pushNotificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<GetPushNotificationHistoryUseCase>(
        instanceName: getPushNotificationHistoryUseCase,
        GetPushNotificationHistoryUseCase(
          pushNotificationRepository:
              getIt<PushNotificationRepository<NotificationEntity>>(
            instanceName: pushNotificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<CancelScheduledPushNotificationUseCase>(
        instanceName: cancelScheduledPushNotificationUseCase,
        CancelScheduledPushNotificationUseCase(
          pushNotificationRepository:
              getIt<PushNotificationRepository<NotificationEntity>>(
            instanceName: pushNotificationRepositoryImpl,
          ),
        ),
      );
  }

  static Future<void> disposeDependencyInjection() async {
    getIt
      ..unregister<PushNotificationRepository<NotificationEntity>>(
          instanceName: pushNotificationRepositoryImpl)
      ..unregister<SendPushNotificationUseCase>(
          instanceName: sendPushNotificationUseCase)
      ..unregister<SchedulePushNotificationUseCase>(
          instanceName: schedulePushNotificationUseCase)
      ..unregister<GetPushNotificationStatusUseCase>(
          instanceName: getPushNotificationStatusUseCase)
      ..unregister<GetPushNotificationHistoryUseCase>(
          instanceName: getPushNotificationHistoryUseCase)
      ..unregister<CancelScheduledPushNotificationUseCase>(
          instanceName: cancelScheduledPushNotificationUseCase);
  }
}

class NotificationSMSDependencyInjection {
  static const String smsNotificationRepositoryImpl =
      'sms_notification_repository_impl';

  static const String sendSMSUseCase = 'send_sms_use_case';
  static const String scheduleSMSUseCase = 'schedule_sms_use_case';
  static const String getSMSStatusUseCase = 'get_sms_status_use_case';
  static const String getSMSHistoryUseCase = 'get_sms_history_use_case';
  static const String cancelScheduledSMSUseCase =
      'cancel_scheduled_sms_use_case';

  // Register dependencies
  static void setupDependencyInjection() {
    getIt
      ..registerSingleton<SMSNotificationRepository<NotificationEntity>>(
        SmsNotificationImpl(),
        instanceName: smsNotificationRepositoryImpl,
      )
      ..registerSingleton<SendSMSUseCase>(
        instanceName: sendSMSUseCase,
        SendSMSUseCase(
          smsNotificationRepository:
              getIt<SMSNotificationRepository<NotificationEntity>>(
            instanceName: smsNotificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<ScheduleSMSUseCase>(
        instanceName: scheduleSMSUseCase,
        ScheduleSMSUseCase(
          smsNotificationRepository:
              getIt<SMSNotificationRepository<NotificationEntity>>(
            instanceName: smsNotificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<GetSMSStatusUseCase>(
        instanceName: getSMSStatusUseCase,
        GetSMSStatusUseCase(
          smsNotificationRepository:
              getIt<SMSNotificationRepository<NotificationEntity>>(
            instanceName: smsNotificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<GetSMSHistoryUseCase>(
        instanceName: getSMSHistoryUseCase,
        GetSMSHistoryUseCase(
          smsNotificationRepository:
              getIt<SMSNotificationRepository<NotificationEntity>>(
            instanceName: smsNotificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<CancelScheduledSMSUseCase>(
        instanceName: cancelScheduledSMSUseCase,
        CancelScheduledSMSUseCase(
          smsNotificationRepository:
              getIt<SMSNotificationRepository<NotificationEntity>>(
            instanceName: smsNotificationRepositoryImpl,
          ),
        ),
      );
  }

  static Future<void> disposeDependencyInjection() async {
    getIt
      ..unregister<SMSNotificationRepository<NotificationEntity>>(
          instanceName: smsNotificationRepositoryImpl)
      ..unregister<SendSMSUseCase>(instanceName: sendSMSUseCase)
      ..unregister<ScheduleSMSUseCase>(instanceName: scheduleSMSUseCase)
      ..unregister<GetSMSStatusUseCase>(instanceName: getSMSStatusUseCase)
      ..unregister<GetSMSHistoryUseCase>(instanceName: getSMSHistoryUseCase)
      ..unregister<CancelScheduledSMSUseCase>(
          instanceName: cancelScheduledSMSUseCase);
  }
}

class NotificationWebhookDependencyInjection {

  static const String webhookNotificationRepositoryImpl =
      'webhook_notification_repository_impl';
  static const String configureWebhookUseCase = 'configure_webhook_use_case';
  static const String getWebhookStatusUseCase = 'get_webhook_status_use_case';
  static const String listConfiguredWebhooksUseCase =
      'list_configured_webhooks_use_case';
  static const String retryWebhookNotificationUseCase =
      'retry_webhook_notification_use_case';
  static const String sendWebhookNotificationUseCase =
      'send_webhook_notification_use_case';
  static const String triggerWebhookNotificationUseCase =
      'trigger_webhook_notification_use_case';

  static void setupDependencyInjection() {
    getIt
      ..registerSingleton<WebhookNotificationRepository<NotificationEntity>>(
        WebhookNotificationImpl(),
        instanceName: webhookNotificationRepositoryImpl,
      )
      ..registerSingleton<ConfigureWebhookUseCase>(
        instanceName: configureWebhookUseCase,
        ConfigureWebhookUseCase(
          webhookNotificationRepository:
              getIt<WebhookNotificationRepository<NotificationEntity>>(
            instanceName: webhookNotificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<GetWebhookStatusUseCase>(
        instanceName: getWebhookStatusUseCase,
        GetWebhookStatusUseCase(
          webhookNotificationRepository:
              getIt<WebhookNotificationRepository<NotificationEntity>>(
            instanceName: webhookNotificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<ListConfiguredWebhooksUseCase>(
        instanceName: listConfiguredWebhooksUseCase,
        ListConfiguredWebhooksUseCase(
          webhookNotificationRepository:
              getIt<WebhookNotificationRepository<NotificationEntity>>(
            instanceName: webhookNotificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<RetryWebhookNotificationUseCase>(
        instanceName: retryWebhookNotificationUseCase,
        RetryWebhookNotificationUseCase(
          webhookNotificationRepository:
              getIt<WebhookNotificationRepository<NotificationEntity>>(
            instanceName: webhookNotificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<SendWebhookNotificationUseCase>(
        instanceName: sendWebhookNotificationUseCase,
        SendWebhookNotificationUseCase(
          webhookNotificationRepository:
              getIt<WebhookNotificationRepository<NotificationEntity>>(
            instanceName: webhookNotificationRepositoryImpl,
          ),
        ),
      )
      ..registerSingleton<TriggerWebhookNotificationUseCase>(
        instanceName: triggerWebhookNotificationUseCase,
        TriggerWebhookNotificationUseCase(
          webhookNotificationRepository:
              getIt<WebhookNotificationRepository<NotificationEntity>>(
            instanceName: webhookNotificationRepositoryImpl,
          ),
        ),
      );
  }

  static Future<void> disposeDependencyInjection() async {
    getIt
      ..unregister<WebhookNotificationRepository<NotificationEntity>>(
          instanceName: webhookNotificationRepositoryImpl)
      ..unregister<ConfigureWebhookUseCase>(
          instanceName: configureWebhookUseCase)
      ..unregister<GetWebhookStatusUseCase>(
          instanceName: getWebhookStatusUseCase)
      ..unregister<ListConfiguredWebhooksUseCase>(
          instanceName: listConfiguredWebhooksUseCase)
      ..unregister<RetryWebhookNotificationUseCase>(
          instanceName: retryWebhookNotificationUseCase)
      ..unregister<SendWebhookNotificationUseCase>(
          instanceName: sendWebhookNotificationUseCase)
      ..unregister<TriggerWebhookNotificationUseCase>(
          instanceName: triggerWebhookNotificationUseCase);
  }
}
