library todoLibrary;

export 'package:nested/nested.dart';
export 'package:flutter/material.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:go_router/go_router.dart';
export 'package:firebase_core/firebase_core.dart';
export 'package:nb_utils/nb_utils.dart' hide log, isWindows, isMacOS, isLinux;
export 'package:flutter_hooks/flutter_hooks.dart';
export 'package:equatable/equatable.dart';
export 'package:easy_localization/easy_localization.dart' hide TextDirection;
export 'package:hive/hive.dart';
export 'package:cloud_firestore/cloud_firestore.dart' hide kIsWasm;
export 'package:get_it/get_it.dart';
export 'package:fpdart/src/either.dart';
export 'package:firebase_crashlytics/firebase_crashlytics.dart';
export 'package:flutter/foundation.dart';
export 'dart:convert';
export 'dart:io';
export 'dart:async';
export 'package:http/http.dart';
export 'package:provider/provider.dart' hide Dispose;
export 'package:todo_app/core/error/error_codes.dart';
export 'package:todo_app/core/network/network_config.dart';
export 'package:mix/mix.dart' hide Box;
export 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
export 'package:freezed_annotation/freezed_annotation.dart';
export 'package:onesignal_flutter/onesignal_flutter.dart';
export 'package:path_provider/path_provider.dart';
export 'package:firebase_auth/firebase_auth.dart' hide UserInfo;
export 'dart:developer' hide Flow;
export 'package:todo_app/core/constants/colors.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:tuple/tuple.dart';
export 'package:flutter_test/flutter_test.dart';
export 'package:todo_app/core/utils/utility_service.dart';
export 'package:firebase_analytics/firebase_analytics.dart';
export 'package:flex_color_picker/flex_color_picker.dart';

/// CORE
export 'package:todo_app/dependency.dart';
export 'package:todo_app/firebase_options.dart';
export 'package:todo_app/main_init.dart';
export 'package:todo_app/core/utils/time_service.dart';
export 'package:todo_app/core/routes/routes.dart';
export 'package:todo_app/core/network/network_service.dart';
export 'package:todo_app/core/routes/route_service.dart';
export 'package:todo_app/core/constants/file_paths.dart';
export 'package:todo_app/core/theme/app_theme_data.dart';
export 'package:todo_app/core/error/failure.dart';
export 'package:todo_app/core/useCases/use_case.dart';
export 'package:todo_app/core/network/rest_api.dart';
export 'package:todo_app/core/utils/log_service.dart';
export 'package:todo_app/core/utils/parse_service.dart';
export 'package:todo_app/core/secret/env.dart';
export 'package:todo_app/core/utils/schedule_service.dart';
export 'dart:ui' show Canvas, Paint, Path, lerpDouble;
export 'package:rxdart/rxdart.dart';
export 'package:async/async.dart';
export 'package:bloc_test/bloc_test.dart';
export 'package:mockito/mockito.dart';

/// Injection
export 'package:todo_app/core/utils/service_dependency_injection.dart';
export 'package:todo_app/feature/auth/auth_dependency_injection.dart';
export 'package:todo_app/feature/tags/tags_dependency_injection.dart';
export 'package:todo_app/feature/todo/todo_dependency_injection.dart';

/// GENERATED
export 'package:todo_app/generated/assets.dart';

/// SHARED
export 'package:todo_app/shared/widget/empty_widget.dart';
export 'package:todo_app/shared/widget/loading_widget.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/bloc/task_detail_bloc.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/bloc/task_detail_event.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/bloc/task_detail_state.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/component/create_pomodoro_component.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/component/create_task_priority_component.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/component/icon_button_component.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/model/Icon_button_component_data.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/task_detail_component.style.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/task_detail_component.variant.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/model/priority_model.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/component/list_item_component.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/component/create_entity_component.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/component/tag_list_component.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/model/empty_entity_model.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/component/empty_component.dart';
export 'package:todo_app/feature/tags/domain/useCases/get_all_tags_by_user_id_use_case.dart';
export 'package:todo_app/feature/tags/domain/useCases/get_tags_by_todo_id_use_case.dart';
export 'package:todo_app/shared/service/task_detail_api_service.dart';
export 'package:todo_app/shared/util/task_detail_selection_util.dart';
export 'package:todo_app/shared/util/entity_utils.dart';


/// TODOs Feature
export 'package:todo_app/feature/todo/data/dataSource/base_api.dart';
export 'package:todo_app/feature/todo/data/dataSource/remote/firebase_api_impl.dart';
export 'package:todo_app/feature/todo/data/dataSource/remote/database_api_impl.dart';
export 'package:todo_app/feature/todo/data/model/response/create_todo_response.dart';
export 'package:todo_app/feature/todo/data/model/response/todo_list_response.dart';
export 'package:todo_app/feature/todo/data/model/todo_model.dart';
export 'package:todo_app/feature/todo/data/repository/todo_repository_impl.dart';
export 'package:todo_app/feature/todo/domain/repository/todo_repository.dart';
export 'package:todo_app/feature/todo/domain/entity/todo_entity.dart';
export 'package:todo_app/feature/todo/domain/useCases/get_todo_list_use_case.dart';
export 'package:todo_app/feature/todo/domain/useCases/create_todo_use_case.dart';
export 'package:todo_app/feature/todo/domain/useCases/update_todo_use_case.dart';
export 'package:todo_app/feature/todo/presentation/bloc/todo_bloc.dart';
export 'package:todo_app/feature/todo/presentation/bloc/todo_event.dart';
export 'package:todo_app/feature/todo/presentation/bloc/todo_state.dart';
export 'package:todo_app/feature/todo/presentation/page/todo_page.dart';
export 'package:todo_app/feature/todo/presentation/widget/todoListComponent/todo_list_component.dart';
export 'package:todo_app/feature/todo/presentation/widget/content_widget.dart';
export 'package:todo_app/feature/todo/domain/useCases/delete_todo_use_case.dart';
export 'package:todo_app/feature/todo/presentation/page/manage_todo_page.dart';
export 'package:todo_app/feature/todo/presentation/widget/todoListItemComponent/todo_list_item_component.variant.dart';
export 'package:todo_app/feature/todo/presentation/widget/backgroundComponent/background_component.dart';
export 'package:todo_app/feature/todo/presentation/widget/backgroundComponent/background_component.variant.dart';
export 'package:todo_app/feature/todo/presentation/widget/todoListItemComponent/todo_list_item_component.style.dart';
export 'package:todo_app/feature/todo/presentation/widget/customButton/custom_button.style.dart';
export 'package:todo_app/feature/todo/presentation/widget/customButton/custom_button.variant.dart';
export 'package:todo_app/feature/todo/presentation/widget/customButton/custom_button.dart';
export 'package:todo_app/feature/todo/presentation/widget/todoListItemComponent/todo_list_item_component.dart';
export 'package:todo_app/feature/todo/presentation/widget/start_drawer.dart';
export 'package:todo_app/feature/todo/presentation/widget/todoListComponent/controller/todo_action_handler.dart';
export 'package:todo_app/feature/todo/manage_todo_page_utils.dart';

// Auth Feature
export 'package:todo_app/feature/auth/data/dataSource/user_base_api.dart';
export 'package:todo_app/feature/auth/data/model/response/login_response.dart';
export 'package:todo_app/feature/auth/domain/entity/loginEntity/login_entity.dart';
export 'package:todo_app/feature/auth/domain/entity/userEntity/user_entity.dart';
export 'package:todo_app/feature/auth/domain/repository/auth_repository.dart';
export 'package:todo_app/feature/auth/presentation/pages/forget_password_page.dart';
export 'package:todo_app/feature/auth/presentation/pages/login_page.dart';
export 'package:todo_app/feature/auth/presentation/pages/profile_page.dart';
export 'package:todo_app/feature/auth/presentation/pages/registration_page.dart';
export 'package:todo_app/feature/auth/presentation/pages/splash_page.dart';
export 'package:todo_app/feature/auth/presentation/bloc/auth/auth_bloc.dart';
export 'package:todo_app/feature/auth/presentation/bloc/auth/auth_event.dart';
export 'package:todo_app/feature/auth/data/dataSource/local/user_credentials.dart';
export 'package:todo_app/core/constants/images.dart';
export 'package:todo_app/feature/auth/domain/useCases/login_use_case.dart';
export 'package:todo_app/feature/auth/presentation/bloc/auth/auth_state.dart';
export 'package:todo_app/feature/auth/presentation/widget/customButton/auth_custom_button.dart';
export 'package:todo_app/feature/auth/data/dataSource/remote/user_database_impl.dart';
export 'package:todo_app/feature/auth/data/repository/auth_repository_impl.dart';
export 'package:todo_app/feature/auth/presentation/widget/custom_divider.dart';
export 'package:todo_app/feature/auth/domain/repository/auth_user_detail_repository.dart';
export 'package:todo_app/shared/widget/dialogs.dart';
export 'package:todo_app/feature/auth/domain/useCases/get_user_detail_use_case.dart';
export 'package:todo_app/feature/auth/data/model/response/fail_response.dart';
export 'package:todo_app/feature/auth/domain/useCases/standard_logout_use_case.dart';
export 'package:todo_app/feature/todo/data/model/manage_todo.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/task_detail_component.dart';

// Tag Feature
export 'package:todo_app/feature/tags/data/data_sources/remote/tags_remote_database.dart';
export 'package:todo_app/feature/tags/data/data_sources/remote/tags_remote_firebase.dart';
export 'package:todo_app/feature/tags/data/data_sources/tags_remote_base.dart';
export 'package:todo_app/feature/tags/data/repositories/tags_repository_impl.dart';
export 'package:todo_app/feature/tags/domain/repositories/tags_repository.dart';
export 'package:todo_app/feature/tags/presentation/bloc/tag_bloc.dart';
export 'package:todo_app/feature/tags/domain/entities/tags.dart';
export 'package:todo_app/feature/tags/domain/repositories/helper_tag_repository.dart';
export 'package:todo_app/feature/tags/domain/useCases/get_all_seeded_tags_use_case.dart';
export 'package:todo_app/feature/tags/domain/useCases/archive_tag_use_case.dart';
export 'package:todo_app/feature/tags/domain/useCases/bulk_create_tags_use_case.dart';
export 'package:todo_app/feature/tags/domain/useCases/bulk_delete_tags_use_case.dart';
export 'package:todo_app/feature/tags/domain/useCases/create_tag_use_case.dart';
export 'package:todo_app/feature/tags/domain/useCases/delete_tag_use_case.dart';
export 'package:todo_app/feature/tags/domain/useCases/get_all_tags_use_case.dart';
export 'package:todo_app/feature/tags/domain/useCases/get_tag_by_id_use_case.dart';
export 'package:todo_app/feature/tags/domain/useCases/restore_tag_use_case.dart';
export 'package:todo_app/feature/tags/domain/useCases/search_tags_use_case.dart';
export 'package:todo_app/feature/tags/domain/useCases/update_tag_use_case.dart';
export 'package:todo_app/feature/tags/presentation/page/tag_view.dart';
export 'package:todo_app/feature/tags/presentation/widget/color_picker_component.dart';
export 'package:todo_app/feature/tags/presentation/widget/tag_button_component.dart';
export 'package:todo_app/feature/tags/presentation/widget/tag_input_field.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/component/pomodoro_cont.dart';
export 'package:todo_app/feature/tags/presentation/bloc/tag_event.dart';
export 'package:todo_app/feature/tags/presentation/bloc/tag_state.dart';
export 'package:todo_app/feature/tags/data/models/response/list_of_tags_seeded_tag_response.dart';

// Pomodoro
export 'package:todo_app/feature/pomodoro/presentation/bloc/pomodoro_bloc.dart';
export 'package:todo_app/feature/pomodoro/presentation/bloc/pomodoro_event.dart';
export 'package:todo_app/feature/pomodoro/data/data_sources/pomodoro_base.dart';
export 'package:todo_app/feature/pomodoro/data/models/pomodoro_model.dart';
export 'package:todo_app/feature/pomodoro/domain/repositories/pomodoro_repository.dart';
export 'package:todo_app/feature/pomodoro/domain/entities/pomodoro_entity.dart';
export 'package:todo_app/feature/pomodoro/data/data_sources/remote/pomodoro_database_api.dart';
export 'package:todo_app/feature/pomodoro/domain/use_cases/create_pomodoro_use_case.dart';
export 'package:todo_app/feature/pomodoro/domain/use_cases/end_pomodoro_use_case.dart';
export 'package:todo_app/feature/pomodoro/domain/use_cases/get_pomodoro_stats_use_case.dart';
export 'package:todo_app/feature/pomodoro/domain/use_cases/resume_pomodoro_use_case.dart';
export 'package:todo_app/feature/pomodoro/domain/use_cases/start_pomodoro_use_case.dart';
export 'package:todo_app/feature/pomodoro/domain/use_cases/stop_pomodoro_use_case.dart';
export 'package:todo_app/feature/pomodoro/data/data_sources/remote/pomodoro_firebase_api.dart';
export 'package:todo_app/feature/pomodoro/data/repositories/pomodoro_repository_impl.dart';
export 'package:todo_app/feature/pomodoro/pomodoro_dependency_injection.dart';
export 'package:todo_app/feature/pomodoro/presentation/pomodoro/pomodoro_view.dart' hide TimerWidget;

export 'package:todo_app/feature/notification/domain/repository/notification_repository.dart';
export 'package:todo_app/feature/notification/domain/repository/push_notification_repository.dart';
export 'package:todo_app/feature/notification/domain/repository/sms_notification_repository.dart';
export 'package:todo_app/feature/notification/domain/repository/webhook_notification_repository.dart';
export 'package:todo_app/feature/notification/presentation/bloc/notification_bloc.dart';
export 'package:todo_app/feature/notification/presentation/bloc/notification_event.dart';
export 'package:todo_app/feature/notification/presentation/bloc/notification_state.dart';
export 'package:todo_app/feature/notification/domain/repository/email_notification_repository.dart';
export 'package:todo_app/feature/notification/domain/repository/notification_analytics_repository.dart';
export 'package:todo_app/feature/notification/domain/entity/notification_entity.dart';
export 'package:todo_app/feature/notification/data/repository/email_notification_impl.dart';
export 'package:todo_app/feature/notification/data/repository/push_notification_impl.dart';
export 'package:todo_app/feature/notification/data/repository/sms_notification_impl.dart';
export 'package:todo_app/feature/notification/domain/useCase/notificationEmail/cancel_scheduled_mail_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notificationEmail/get_email_history_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notificationEmail/get_email_status_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notificationEmail/schedule_email_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notificationEmail/send_email_use_case.dart';
export 'package:todo_app/feature/notification/domain/useCase/notificationPush/cancel_scheduled_push_notification_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notificationPush/get_push_notification_history_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notificationPush/get_push_notification_status_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notificationPush/schedule_push_notification_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notificationPush/send_push_notification_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notificationSMS/cancel_scheduled_sms_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notificationSMS/get_sms_history_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notificationSMS/get_sms_status_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notificationSMS/schedule_sms_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notificationSMS/send_sms_usecase.dart';
export 'package:todo_app/feature/notification/data/repository/notification_analytics_impl.dart';
export 'package:todo_app/feature/notification/data/repository/webhook_notification_impl.dart';
export 'package:todo_app/feature/notification/domain/useCase/notification/track_notification_delivery_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notification/track_notification_open_rate_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notificationAnalytics/get_historical_notification_data_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notificationAnalytics/get_notification_engagement_report_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notificationAnalytics/get_notification_statistics_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notificationWebhook/configure_webhook_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notificationWebhook/get_webhook_status_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notificationWebhook/list_configured_webhooks_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notificationWebhook/retry_webhook_notification_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notificationWebhook/send_webhook_notification_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notificationWebhook/trigger_webhook_notification_usecase.dart';
export 'package:todo_app/feature/notification/data/repository/notification_impl.dart';
export 'package:todo_app/feature/notification/domain/useCase/notification/categorize_notification_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notification/configure_notification_settings_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notification/enable_do_not_disturb_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notification/encrypt_notification_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notification/ensure_gdpr_compliance_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notification/fetch_notification_history_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notification/get_unread_notifications_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notification/integrate_third_party_service_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notification/mark_notification_as_read_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notification/queue_notification_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notification/retry_notification_delivery_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notification/send_batch_notification_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notification/send_in_app_notification_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notification/send_multi_channel_notification_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notification/send_personalized_notification_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notification/send_real_time_notification_usecase.dart';
export 'package:todo_app/feature/notification/domain/useCase/notification/set_notification_frequency_usecase.dart';
export 'package:todo_app/feature/notification/presentation/view/notification_view.dart';
export 'package:todo_app/feature/notification/notification_dependency_injection.dart';

export 'package:todo_app/feature/settings/domain/repository/account_security_repository.dart';
export 'package:todo_app/feature/settings/domain/repository/app_appearance_repository.dart';
export 'package:todo_app/feature/settings/domain/repository/application_settings_repository.dart';
export 'package:todo_app/feature/settings/domain/repository/billing_and_subscription_repository.dart';
export 'package:todo_app/feature/settings/domain/repository/data_analytics_repository.dart';
export 'package:todo_app/feature/settings/domain/repository/date_time_repository.dart';
export 'package:todo_app/feature/settings/domain/repository/linked_accounts_repository.dart';
export 'package:todo_app/feature/settings/domain/repository/payment_account_repository.dart';
export 'package:todo_app/feature/settings/domain/repository/pomodoro_preference_repository.dart';
export 'package:todo_app/feature/settings/domain/repository/profile_repository.dart';
export 'package:todo_app/feature/settings/presentation/view/setting_view.dart';

export 'package:todo_app/feature/comment/presentation/bloc/comment_bloc.dart';
export 'package:todo_app/feature/comment/presentation/bloc/comment_event.dart';

export 'package:todo_app/feature/project/domain/entities/projectEntity/project_entity.dart';
export 'package:todo_app/feature/project/domain/repositories/project_repository.dart';
export 'package:todo_app/feature/project/data/models/projectModel/project_model.dart';
export 'package:todo_app/feature/project/presentation/bloc/project_bloc.dart';
export 'package:todo_app/feature/project/presentation/bloc/project_event.dart';
export 'package:todo_app/feature/project/presentation/pages/project_view.dart';
export 'package:todo_app/feature/project/data/repositories/project_repository_impl.dart';
export 'package:todo_app/feature/project/domain/use_cases/project/archive_project_use_case.dart';
export 'package:todo_app/feature/project/domain/use_cases/project/assign_todos_to_project_use_case.dart';
export 'package:todo_app/feature/project/domain/use_cases/project/bulk_create_projects_use_case.dart';
export 'package:todo_app/feature/project/domain/use_cases/project/bulk_delete_projects_use_case.dart';
export 'package:todo_app/feature/project/domain/use_cases/project/create_project_use_case.dart';
export 'package:todo_app/feature/project/domain/use_cases/project/delete_project_use_case.dart';
export 'package:todo_app/feature/project/domain/use_cases/project/get_all_projects_use_case.dart';
export 'package:todo_app/feature/project/domain/use_cases/project/get_paginated_projects_for_todo_use_case.dart';
export 'package:todo_app/feature/project/domain/use_cases/project/get_paginated_todos_for_project_use_case.dart';
export 'package:todo_app/feature/project/domain/use_cases/project/get_project_by_id_use_case.dart';
export 'package:todo_app/feature/project/domain/use_cases/project/restore_project_use_case.dart';
export 'package:todo_app/feature/project/domain/use_cases/project/search_projects_use_case.dart';
export 'package:todo_app/feature/project/domain/use_cases/project/update_project_use_case.dart';
export 'package:todo_app/feature/project/projects_dependency_injection.dart';