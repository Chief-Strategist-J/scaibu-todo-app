library use_case;

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/settings/domain/repositories/account_security_repository.dart';
import 'package:todo_app/feature/settings/domain/repositories/app_appearance_repository.dart';
import 'package:todo_app/feature/settings/domain/repositories/application_settings_repository.dart';
import 'package:todo_app/feature/settings/domain/repositories/billing_and_subscription_repository.dart';
import 'package:todo_app/feature/settings/domain/repositories/data_analytics_repository.dart';
import 'package:todo_app/feature/settings/domain/repositories/date_time_repository.dart';
import 'package:todo_app/feature/settings/domain/repositories/linked_accounts_repository.dart';
import 'package:todo_app/feature/settings/domain/repositories/payment_account_repository.dart';
import 'package:todo_app/feature/settings/domain/repositories/pomodoro_preference_repository.dart';
import 'package:todo_app/feature/settings/domain/repositories/profile_repository.dart';

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

part 'package:todo_app/feature/project/domain/useCases/project/archive_project_use_case.dart';
part 'package:todo_app/feature/project/domain/useCases/project/assign_todos_to_project_use_case.dart';
part 'package:todo_app/feature/project/domain/useCases/project/bulk_create_projects_use_case.dart';
part 'package:todo_app/feature/project/domain/useCases/project/bulk_delete_projects_use_case.dart';
part 'package:todo_app/feature/project/domain/useCases/project/create_project_use_case.dart';
part 'package:todo_app/feature/project/domain/useCases/project/delete_project_use_case.dart';
part 'package:todo_app/feature/project/domain/useCases/project/get_all_projects_use_case.dart';
part 'package:todo_app/feature/project/domain/useCases/project/get_paginated_projects_for_todo_use_case.dart';
part 'package:todo_app/feature/project/domain/useCases/project/get_paginated_todos_for_project_use_case.dart';
part 'package:todo_app/feature/project/domain/useCases/project/get_project_by_id_use_case.dart';
part 'package:todo_app/feature/project/domain/useCases/project/get_project_category_data_use_case.dart';
part 'package:todo_app/feature/project/domain/useCases/project/restore_project_use_case.dart';
part 'package:todo_app/feature/project/domain/useCases/project/search_projects_use_case.dart';
part 'package:todo_app/feature/project/domain/useCases/project/update_project_use_case.dart';
part 'package:todo_app/feature/settings/domain/useCase/accountSecurity/change_account_password_usecase.dart';
part 'package:todo_app/feature/settings/domain/useCase/accountSecurity/get_account_security_settings_usecase.dart';
part 'package:todo_app/feature/settings/domain/useCase/accountSecurity/set_two_factor_authentication_usecase.dart';
part 'package:todo_app/feature/settings/domain/useCase/accountSecurity/update_account_security_settings_usecase.dart';
part 'package:todo_app/feature/settings/domain/useCase/appAppearance/get_app_appearance_settings_usecase.dart';
part 'package:todo_app/feature/settings/domain/useCase/appAppearance/update_app_appearance_settings_usecase.dart';
part 'package:todo_app/feature/settings/domain/useCase/applicationSettings/get_application_settings_usecase.dart';
part 'package:todo_app/feature/settings/domain/useCase/applicationSettings/reset_application_settings_usecase.dart';
part 'package:todo_app/feature/settings/domain/useCase/applicationSettings/update_application_settings_usecase.dart';
part 'package:todo_app/feature/settings/domain/useCase/billingAndSubscription/cancel_subscription_use_case.dart';
part 'package:todo_app/feature/settings/domain/useCase/billingAndSubscription/get_billing_details_use_case.dart';
part 'package:todo_app/feature/settings/domain/useCase/billingAndSubscription/get_subscription_details_use_case.dart';
part 'package:todo_app/feature/settings/domain/useCase/billingAndSubscription/update_billing_details_use_case.dart';
part 'package:todo_app/feature/settings/domain/useCase/billingAndSubscription/update_subscription_details_use_case.dart';
part 'package:todo_app/feature/settings/domain/useCase/dataAnalytics/get_data_analytics_use_case.dart';
part 'package:todo_app/feature/settings/domain/useCase/dataAnalytics/get_historical_data_use_case.dart';
part 'package:todo_app/feature/settings/domain/useCase/dataAnalytics/update_data_analytics_settings_use_case.dart';
part 'package:todo_app/feature/settings/domain/useCase/dateTime/convert_date_time_use_case.dart';
part 'package:todo_app/feature/settings/domain/useCase/dateTime/get_date_time_settings_use_case.dart';
part 'package:todo_app/feature/settings/domain/useCase/dateTime/update_date_time_settings_use_case.dart';
part 'package:todo_app/feature/settings/domain/useCase/linkedAccounts/get_linked_accounts_use_case.dart';
part 'package:todo_app/feature/settings/domain/useCase/linkedAccounts/link_account_use_case.dart';
part 'package:todo_app/feature/settings/domain/useCase/linkedAccounts/unlink_account_use_case.dart';
part 'package:todo_app/feature/settings/domain/useCase/paymentAccount/add_payment_method_use_case.dart';
part 'package:todo_app/feature/settings/domain/useCase/paymentAccount/get_payment_account_details_use_case.dart';
part 'package:todo_app/feature/settings/domain/useCase/paymentAccount/remove_payment_method_use_case.dart';
part 'package:todo_app/feature/settings/domain/useCase/paymentAccount/update_payment_account_details_use_case.dart';
part 'package:todo_app/feature/settings/domain/useCase/pomodoroPreference/get_pomodoro_preferences_use_case.dart';
part 'package:todo_app/feature/settings/domain/useCase/pomodoroPreference/update_pomodoro_preferences_use_case.dart';
part 'package:todo_app/feature/settings/domain/useCase/profile/delete_user_profile_use_case.dart';
part 'package:todo_app/feature/settings/domain/useCase/profile/get_user_profile_use_case.dart';
part 'package:todo_app/feature/settings/domain/useCase/profile/update_user_profile_use_case.dart';
part 'package:todo_app/feature/todo/domain/useCase/create_todo_use_case.dart';
part 'package:todo_app/feature/todo/domain/useCase/delete_todo_use_case.dart';
part 'package:todo_app/feature/todo/domain/useCase/get_todo_list_use_case.dart';
part 'package:todo_app/feature/todo/domain/useCase/update_todo_use_case.dart';
part 'package:todo_app/feature/tags/domain/useCases/archive_tag_use_case.dart';
part 'package:todo_app/feature/tags/domain/useCases/bulk_create_tags_use_case.dart';
part 'package:todo_app/feature/tags/domain/useCases/bulk_delete_tags_by_todo_id_use_case.dart';
part 'package:todo_app/feature/tags/domain/useCases/bulk_delete_tags_use_case.dart';
part 'package:todo_app/feature/tags/domain/useCases/create_tag_use_case.dart';
part 'package:todo_app/feature/tags/domain/useCases/delete_tag_use_case.dart';
part 'package:todo_app/feature/tags/domain/useCases/get_all_seeded_tags_use_case.dart';
part 'package:todo_app/feature/tags/domain/useCases/get_all_tags_by_user_id_use_case.dart';
part 'package:todo_app/feature/tags/domain/useCases/get_all_tags_use_case.dart';
part 'package:todo_app/feature/tags/domain/useCases/get_tag_by_id_use_case.dart';
part 'package:todo_app/feature/tags/domain/useCases/get_tags_by_todo_id_use_case.dart';
part 'package:todo_app/feature/tags/domain/useCases/restore_tag_use_case.dart';
part 'package:todo_app/feature/tags/domain/useCases/search_tags_use_case.dart';
part 'package:todo_app/feature/tags/domain/useCases/update_tag_use_case.dart';



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
