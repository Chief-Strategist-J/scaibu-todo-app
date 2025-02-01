library use_case;

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:todo_app/core/app_library.dart';

part 'package:todo_app/feature/todo/domain/useCase/update_todo_use_case.dart';

part 'package:todo_app/feature/todo/domain/useCase/get_todo_list_use_case.dart';

part 'package:todo_app/feature/todo/domain/useCase/delete_todo_use_case.dart';

part 'package:todo_app/feature/todo/domain/useCase/create_todo_use_case.dart';

part 'package:todo_app/feature/auth/domain/useCases/get_user_detail_use_case.dart';

part 'package:todo_app/feature/auth/domain/useCases/login_use_case.dart';

part 'package:todo_app/feature/auth/domain/useCases/standard_logout_use_case.dart';

part 'package:todo_app/feature/notification/domain/useCase/notification/categorize_notification_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notification/configure_notification_settings_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notification/enable_do_not_disturb_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notification/encrypt_notification_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notification/ensure_gdpr_compliance_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notification/fetch_notification_history_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notification/get_unread_notifications_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notification/integrate_third_party_service_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notification/mark_notification_as_read_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notification/queue_notification_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notification/retry_notification_delivery_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notification/send_batch_notification_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notification/send_in_app_notification_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notification/send_multi_channel_notification_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notification/send_personalized_notification_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notification/send_real_time_notification_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notification/set_notification_frequency_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notification/track_notification_delivery_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notification/track_notification_open_rate_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notificationAnalytics/get_historical_notification_data_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notificationAnalytics/get_notification_engagement_report_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notificationAnalytics/get_notification_statistics_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notificationEmail/cancel_scheduled_mail_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notificationEmail/get_email_history_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notificationEmail/get_email_status_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notificationEmail/schedule_email_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notificationEmail/send_email_use_case.dart';

part 'package:todo_app/feature/notification/domain/useCase/notificationPush/cancel_scheduled_push_notification_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notificationPush/get_push_notification_history_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notificationPush/get_push_notification_status_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notificationPush/schedule_push_notification_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notificationPush/send_push_notification_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notificationSMS/cancel_scheduled_sms_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notificationSMS/get_sms_history_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notificationSMS/get_sms_status_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notificationSMS/schedule_sms_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notificationSMS/send_sms_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notificationWebhook/configure_webhook_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notificationWebhook/get_webhook_status_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notificationWebhook/list_configured_webhooks_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notificationWebhook/retry_webhook_notification_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notificationWebhook/send_webhook_notification_usecase.dart';

part 'package:todo_app/feature/notification/domain/useCase/notificationWebhook/trigger_webhook_notification_usecase.dart';

part 'package:todo_app/feature/pomodoro/domain/useCase/create_pomodoro_use_case.dart';

part 'package:todo_app/feature/pomodoro/domain/useCase/end_pomodoro_use_case.dart';

part 'package:todo_app/feature/pomodoro/domain/useCase/get_pomodoro_stats_use_case.dart';

part 'package:todo_app/feature/pomodoro/domain/useCase/resume_pomodoro_use_case.dart';

part 'package:todo_app/feature/pomodoro/domain/useCase/start_pomodoro_use_case.dart';

part 'package:todo_app/feature/pomodoro/domain/useCase/stop_pomodoro_use_case.dart';

/// Abstract base class for use cases.
sealed class UseCase<Type, Params> {
  /// Executes the use case logic with the provided [params].
  Future<Either<Failure, Type>> call(final Params params);
}

/// TO-DO: implement call
class UseCaseType extends UseCase<Type, int> {
  @override
  Future<Either<Failure, Type>> call(final int params) {
    // TO-DO: implement call
    throw UnimplementedError();
  }
}

/// A class representing a scenario where no parameters
/// are required for a use case.
class NoParams extends Equatable {
  @override
  List<Object> get props => <Object>[]; // No parameters, returns an empty list.
}
