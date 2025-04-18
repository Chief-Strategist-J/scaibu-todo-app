export 'dart:async';
export 'dart:collection';
export 'dart:convert';
export 'dart:developer' hide Flow;
export 'dart:io';
export 'dart:math' hide log;
export 'dart:ui' show Canvas, Paint, Path, lerpDouble;

export 'package:async/async.dart';
export 'package:bloc_test/bloc_test.dart';
export 'package:cloud_firestore/cloud_firestore.dart' hide kIsWasm;
export 'package:easy_localization/easy_localization.dart' hide TextDirection;
export 'package:equatable/equatable.dart';
export 'package:firebase_analytics/firebase_analytics.dart';
export 'package:firebase_auth/firebase_auth.dart' hide UserInfo;
export 'package:firebase_core/firebase_core.dart';
export 'package:firebase_crashlytics/firebase_crashlytics.dart';
export 'package:flex_color_picker/flex_color_picker.dart';
export 'package:flutter/foundation.dart';
export 'package:flutter/material.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:flutter_hooks/flutter_hooks.dart';
export 'package:flutter_secure_storage/flutter_secure_storage.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:fpdart/src/either.dart';
export 'package:freezed_annotation/freezed_annotation.dart';
export 'package:get_it/get_it.dart';
export 'package:go_router/go_router.dart';
export 'package:hive/hive.dart';
export 'package:http/http.dart';
export 'package:lottie/lottie.dart';
export 'package:mix/mix.dart' hide Box;
export 'package:mockito/mockito.dart';
export 'package:nb_utils/nb_utils.dart'
    hide isLinux, isMacOS, isWindows, log, tan;
export 'package:nested/nested.dart';

// export 'package:onesignal_flutter/onesignal_flutter.dart';
export 'package:path_provider/path_provider.dart';
export 'package:provider/provider.dart' hide Dispose;
export 'package:rxdart/rxdart.dart';
export 'package:todo_app/core/constants/colors.dart';
export 'package:todo_app/core/constants/file_paths.dart';
export 'package:todo_app/core/constants/images.dart';
export 'package:todo_app/core/error/error_codes.dart';

/// Networking
export 'package:todo_app/core/error/exceptions.dart';
export 'package:todo_app/core/error/failure.dart';
export 'package:todo_app/core/network/cache/async_clock.dart';
export 'package:todo_app/core/network/cache/cache_config.dart';
export 'package:todo_app/core/network/cache/in_memory_cache.dart';
export 'package:todo_app/core/network/extension/http_client_extension.dart';
export 'package:todo_app/core/network/extension/rest_api_impl_extension.dart';
export 'package:todo_app/core/network/helper/file_downloader.dart';
export 'package:todo_app/core/network/helper/file_uploader.dart';
export 'package:todo_app/core/network/helper/logger.dart';
export 'package:todo_app/core/network/helper/network_monitor.dart';
export 'package:todo_app/core/network/helper/request_metrics.dart';
export 'package:todo_app/core/network/helper/request_queue.dart';
export 'package:todo_app/core/network/helper/retry_policy.dart';
export 'package:todo_app/core/network/helper/token_manager.dart';
export 'package:todo_app/core/network/model/request_model.dart';
export 'package:todo_app/core/network/network_config.dart';
export 'package:todo_app/core/network/network_service.dart';
export 'package:todo_app/core/network/rest_api.dart';
export 'package:todo_app/core/routes/route_service.dart';
export 'package:todo_app/core/routes/routes.dart';
export 'package:todo_app/core/secret/env.dart';
export 'package:todo_app/core/theme/app_theme_data.dart';
export 'package:todo_app/core/useCases/use_case.dart';
export 'package:todo_app/core/utils/log_service.dart';
export 'package:todo_app/core/utils/parse_service.dart';
export 'package:todo_app/core/utils/schedule_service.dart';

/// Injection
export 'package:todo_app/core/utils/service_dependency_injection.dart';
export 'package:todo_app/core/utils/time_service.dart';
export 'package:todo_app/core/utils/utility_service.dart';

/// CORE
export 'package:todo_app/dependency.dart';
export 'package:todo_app/feature/auth/auth_dependency_injection.dart';
export 'package:todo_app/feature/auth/data/dataSource/local/user_credentials.dart';
export 'package:todo_app/feature/auth/data/dataSource/remote/user_database_impl.dart';

// Auth Feature
export 'package:todo_app/feature/auth/data/model/response/fail_response.dart';
export 'package:todo_app/feature/auth/data/model/response/login_response.dart';
export 'package:todo_app/feature/auth/data/repository/auth_repository_impl.dart';
export 'package:todo_app/feature/auth/domain/entity/loginEntity/login_entity.dart';
export 'package:todo_app/feature/auth/domain/entity/userEntity/user_entity.dart';
export 'package:todo_app/feature/auth/domain/repository/auth_repository.dart';
export 'package:todo_app/feature/auth/domain/repository/auth_user_detail_repository.dart';
export 'package:todo_app/feature/auth/presentation/bloc/auth/auth_bloc.dart';
export 'package:todo_app/feature/auth/presentation/bloc/auth/auth_event.dart';
export 'package:todo_app/feature/auth/presentation/bloc/auth/auth_state.dart';
export 'package:todo_app/feature/auth/presentation/pages/forget_password_page.dart';
export 'package:todo_app/feature/auth/presentation/pages/login_page.dart';
export 'package:todo_app/feature/auth/presentation/pages/profile_page.dart';
export 'package:todo_app/feature/auth/presentation/pages/registration_page.dart';
export 'package:todo_app/feature/auth/presentation/pages/splash_page.dart';
export 'package:todo_app/feature/auth/presentation/widget/customButton/auth_custom_button.dart';
export 'package:todo_app/feature/auth/presentation/widget/custom_divider.dart';
export 'package:todo_app/feature/comment/presentation/bloc/comment_bloc.dart';
export 'package:todo_app/feature/comment/presentation/bloc/comment_event.dart';
export 'package:todo_app/feature/notification/data/repository/email_notification_repository.dart';
export 'package:todo_app/feature/notification/data/repository/notification_analytics_repository.dart';
export 'package:todo_app/feature/notification/data/repository/notification_repository.dart';
export 'package:todo_app/feature/notification/data/repository/push_notification_repository.dart';
export 'package:todo_app/feature/notification/data/repository/sms_notification_repository.dart';
export 'package:todo_app/feature/notification/data/repository/webhook_notification_repository.dart';
export 'package:todo_app/feature/notification/domain/entity/notification_entity.dart';
export 'package:todo_app/feature/notification/domain/repository/email_notification_repository.dart';
export 'package:todo_app/feature/notification/domain/repository/notification_analytics_repository.dart';
export 'package:todo_app/feature/notification/domain/repository/notification_repository.dart';
export 'package:todo_app/feature/notification/domain/repository/push_notification_repository.dart';
export 'package:todo_app/feature/notification/domain/repository/sms_notification_repository.dart';
export 'package:todo_app/feature/notification/domain/repository/webhook_notification_repository.dart';
export 'package:todo_app/feature/notification/notification_dependency_injection.dart';
export 'package:todo_app/feature/notification/presentation/bloc/notification_bloc.dart';
export 'package:todo_app/feature/notification/presentation/bloc/notification_event.dart';
export 'package:todo_app/feature/notification/presentation/bloc/notification_state.dart';
export 'package:todo_app/feature/notification/presentation/view/notification_view.dart';
export 'package:todo_app/feature/pomodoro/data/dataSource/pomodoro_base.dart';
export 'package:todo_app/feature/pomodoro/data/dataSource/remote/pomodoro_database_api.dart';
export 'package:todo_app/feature/pomodoro/data/dataSource/remote/pomodoro_firebase_api.dart';
export 'package:todo_app/feature/pomodoro/data/models/pomodoro_model.dart';
export 'package:todo_app/feature/pomodoro/data/repositories/pomodoro_repository.dart';
export 'package:todo_app/feature/pomodoro/domain/entities/pomodoro_entity.dart';
export 'package:todo_app/feature/pomodoro/domain/repositories/pomodoro_repository.dart';
export 'package:todo_app/feature/pomodoro/pomodoro_dependency_injection.dart';

// Pomodoro
export 'package:todo_app/feature/pomodoro/presentation/bloc/pomodoro_bloc.dart';
export 'package:todo_app/feature/pomodoro/presentation/bloc/pomodoro_event.dart';
export 'package:todo_app/feature/pomodoro/presentation/pomodoro/pomodoro_view.dart'
    hide TimerWidget;
export 'package:todo_app/feature/project/data/models/projectModel/project_model.dart';
export 'package:todo_app/feature/project/data/models/project_category_config.dart';
export 'package:todo_app/feature/project/data/models/project_page_param.dart';
export 'package:todo_app/feature/project/data/repositories/project_repository_impl.dart';
export 'package:todo_app/feature/project/domain/entities/projectCategoryDataEntity/project_category_data_entity.dart';
export 'package:todo_app/feature/project/domain/entities/projectEntity/project_entity.dart';
export 'package:todo_app/feature/project/domain/repositories/project_repository.dart';
export 'package:todo_app/feature/project/presentation/bloc/project_bloc.dart';
export 'package:todo_app/feature/project/presentation/bloc/project_event.dart';
export 'package:todo_app/feature/project/presentation/bloc/project_state.dart';
export 'package:todo_app/feature/project/presentation/pages/project_list_screen.dart';
export 'package:todo_app/feature/project/presentation/pages/project_view.dart';
export 'package:todo_app/feature/project/presentation/widgets/customCheckboxComponent/custom_checkbox_component.dart';
export 'package:todo_app/feature/project/presentation/widgets/customCheckboxComponent/custom_checkbox_component.style.dart';
export 'package:todo_app/feature/project/presentation/widgets/customCheckboxComponent/custom_checkbox_component.variant.dart';
export 'package:todo_app/feature/project/presentation/widgets/projectCategorySelectorComponent/project_category_component.style.dart';
export 'package:todo_app/feature/project/presentation/widgets/projectCategorySelectorComponent/project_category_component.variant.dart';
export 'package:todo_app/feature/project/presentation/widgets/projectCategorySelectorComponent/project_category_selector_component.dart';
export 'package:todo_app/feature/project/presentation/widgets/projectListItemComponent/project_item_component.dart';
export 'package:todo_app/feature/project/presentation/widgets/projectListItemComponent/project_item_component.style.dart';
export 'package:todo_app/feature/project/presentation/widgets/projectListItemComponent/project_item_component.variant.dart';
export 'package:todo_app/feature/project/projects_dependency_injection.dart';
export 'package:todo_app/feature/settings/presentation/view/setting_view.dart';

// Tag Feature
export 'package:todo_app/feature/tags/data/data_sources/remote/tags_remote_database.dart';
export 'package:todo_app/feature/tags/data/data_sources/remote/tags_remote_firebase.dart';
export 'package:todo_app/feature/tags/data/data_sources/tags_remote_base.dart';
export 'package:todo_app/feature/tags/data/models/response/list_of_tags_seeded_tag_response.dart';
export 'package:todo_app/feature/tags/data/repositories/tags_repository_impl.dart';
export 'package:todo_app/feature/tags/domain/entities/tags.dart';
export 'package:todo_app/feature/tags/domain/repositories/tags_repository.dart';
export 'package:todo_app/feature/tags/presentation/bloc/tag_bloc.dart';
export 'package:todo_app/feature/tags/presentation/bloc/tag_event.dart';
export 'package:todo_app/feature/tags/presentation/bloc/tag_state.dart';
export 'package:todo_app/feature/tags/presentation/page/tag_view.dart';
export 'package:todo_app/feature/tags/presentation/widget/color_picker_component.dart';
export 'package:todo_app/feature/tags/presentation/widget/tag_button_component.dart';
export 'package:todo_app/feature/tags/presentation/widget/tag_input_field.dart';
export 'package:todo_app/feature/tags/tags_dependency_injection.dart';

/// TODOs Feature
export 'package:todo_app/feature/todo/data/dataSource/base_api.dart';
export 'package:todo_app/feature/todo/data/dataSource/remote/database_api_impl.dart';
export 'package:todo_app/feature/todo/data/dataSource/remote/firebase_api_impl.dart';
export 'package:todo_app/feature/todo/data/model/manage_todo.dart';
export 'package:todo_app/feature/todo/data/model/response/create_todo_response.dart';
export 'package:todo_app/feature/todo/data/model/response/todo_list_response.dart';
export 'package:todo_app/feature/todo/data/model/todo_model.dart';
export 'package:todo_app/feature/todo/data/repository/todo_repository_impl.dart';
export 'package:todo_app/feature/todo/domain/entity/todo_entity.dart';
export 'package:todo_app/feature/todo/domain/entity/update_todo_param.dart';
export 'package:todo_app/feature/todo/domain/repository/todo_repository.dart';
export 'package:todo_app/feature/todo/manage_todo_page_utils.dart';
export 'package:todo_app/feature/todo/presentation/bloc/todo_bloc.dart';
export 'package:todo_app/feature/todo/presentation/bloc/todo_event.dart';
export 'package:todo_app/feature/todo/presentation/bloc/todo_state.dart';
export 'package:todo_app/feature/todo/presentation/page/manage_todo_page.dart';
export 'package:todo_app/feature/todo/presentation/page/todo_page.dart';
export 'package:todo_app/feature/todo/presentation/widget/backgroundComponent/background_component.dart';
export 'package:todo_app/feature/todo/presentation/widget/backgroundComponent/background_component.variant.dart';
export 'package:todo_app/feature/todo/presentation/widget/content_widget.dart';
export 'package:todo_app/feature/todo/presentation/widget/customButton/custom_button.dart';
export 'package:todo_app/feature/todo/presentation/widget/customButton/custom_button.style.dart';
export 'package:todo_app/feature/todo/presentation/widget/customButton/custom_button.variant.dart';
export 'package:todo_app/feature/todo/presentation/widget/drawerHeaderComponent/drawer_header_component.dart';
export 'package:todo_app/feature/todo/presentation/widget/drawerHeaderComponent/drawer_item_component.dart';
export 'package:todo_app/feature/todo/presentation/widget/start_drawer.dart';
export 'package:todo_app/feature/todo/presentation/widget/todoListComponent/controller/todo_action_handler.dart';
export 'package:todo_app/feature/todo/presentation/widget/todoListComponent/todo_list_component.dart';
export 'package:todo_app/feature/todo/presentation/widget/todoListItemComponent/todo_list_item_component.dart';
export 'package:todo_app/feature/todo/presentation/widget/todoListItemComponent/todo_list_item_component.style.dart';
export 'package:todo_app/feature/todo/presentation/widget/todoListItemComponent/todo_list_item_component.variant.dart';
export 'package:todo_app/feature/todo/todo_dependency_injection.dart';
export 'package:todo_app/firebase_options.dart';

/// GENERATED
export 'package:todo_app/generated/assets.dart';
export 'package:todo_app/main.dart';
export 'package:todo_app/main_init.dart';
export 'package:todo_app/shared/service/task_detail_api_service.dart';
export 'package:todo_app/shared/util/entity_utils.dart';
export 'package:todo_app/shared/util/task_detail_selection_util.dart';
export 'package:todo_app/shared/widget/dialogs.dart';

/// SHARED
export 'package:todo_app/shared/widget/empty_widget.dart';
export 'package:todo_app/shared/widget/loading_widget.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/bloc/task_detail_bloc.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/bloc/task_detail_event.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/bloc/task_detail_state.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/entity/empty_entity_model.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/entity/icon_button_component_data.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/entity/priority_model.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/page/create_entity_component.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/page/create_pomodoro_component.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/page/create_task_priority_component.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/page/empty_component.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/page/icon_button_component.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/page/list_item_component.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/page/pomodoro_cont.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/page/tag_list_component.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/task_detail_component.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/task_detail_component.style.dart';
export 'package:todo_app/shared/widget/taskDetailComponent/task_detail_component.variant.dart';
export 'package:tuple/tuple.dart';
