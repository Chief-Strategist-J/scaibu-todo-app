import 'package:todo_app/core/app_library.dart';


class EmailNotificationDependencyInjection {
  static const emailNotificationRepositoryImpl = 'email_notification_repository_impl';

  static const sendEmailUseCase = 'send_email_use_case';
  static const scheduleEmailUseCase = 'schedule_email_use_case';
  static const getEmailStatusUseCase = 'get_email_status_use_case';
  static const getEmailHistoryUseCase = 'get_email_history_use_case';
  static const cancelScheduledEmailUseCase = 'cancel_scheduled_email_use_case';

  static void setupDependencyInjection() {
    getIt.registerSingleton<EmailNotificationRepository<NotificationEntity>>(
      EmailNotificationImpl(),
      instanceName: EmailNotificationDependencyInjection.emailNotificationRepositoryImpl,
    );

    getIt.registerSingleton<SendEmailUseCase>(
      instanceName: sendEmailUseCase,
      SendEmailUseCase(
        emailNotificationRepository: getIt<EmailNotificationRepository<NotificationEntity>>(
          instanceName: EmailNotificationDependencyInjection.emailNotificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<ScheduleEmailUseCase>(
      instanceName: scheduleEmailUseCase,
      ScheduleEmailUseCase(
        emailNotificationRepository: getIt<EmailNotificationRepository<NotificationEntity>>(
          instanceName: EmailNotificationDependencyInjection.emailNotificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<GetEmailStatusUseCase>(
      instanceName: getEmailStatusUseCase,
      GetEmailStatusUseCase(
        emailNotificationRepository: getIt<EmailNotificationRepository<NotificationEntity>>(
          instanceName: EmailNotificationDependencyInjection.emailNotificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<GetEmailHistoryUseCase<NotificationEntity>>(
      instanceName: getEmailHistoryUseCase,
      GetEmailHistoryUseCase<NotificationEntity>(
        emailNotificationRepository: getIt<EmailNotificationRepository<NotificationEntity>>(
          instanceName: EmailNotificationDependencyInjection.emailNotificationRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<CancelScheduledEmailUseCase>(
      instanceName: cancelScheduledEmailUseCase,
      CancelScheduledEmailUseCase(
        emailNotificationRepository: getIt<EmailNotificationRepository<NotificationEntity>>(
          instanceName: EmailNotificationDependencyInjection.emailNotificationRepositoryImpl,
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

class PushNotificationDependencyInjection {
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

class NotificationDependencyInjection {
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

  // Dispose dependencies
  static void disposeDependencyInjection() {
    getIt.unregister<SMSNotificationRepository<NotificationEntity>>(instanceName: smsNotificationRepositoryImpl);
    getIt.unregister<SendSMSUseCase>(instanceName: sendSMSUseCase);
    getIt.unregister<ScheduleSMSUseCase>(instanceName: scheduleSMSUseCase);
    getIt.unregister<GetSMSStatusUseCase>(instanceName: getSMSStatusUseCase);
    getIt.unregister<GetSMSHistoryUseCase>(instanceName: getSMSHistoryUseCase);
    getIt.unregister<CancelScheduledSMSUseCase>(instanceName: cancelScheduledSMSUseCase);
  }
}
