library todoLibrary;

export 'package:nested/nested.dart';
export 'package:flutter/material.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:go_router/go_router.dart';
export 'package:firebase_core/firebase_core.dart';
export 'package:nb_utils/nb_utils.dart';
export 'package:flutter_hooks/flutter_hooks.dart';
export 'package:equatable/equatable.dart';
export 'package:easy_localization/easy_localization.dart' hide TextDirection;
export 'package:hive/hive.dart';
export 'package:cloud_firestore/cloud_firestore.dart';
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

/// SHARED
export 'package:todo_app/shared/widget/empty_widget.dart';
export 'package:todo_app/shared/widget/loading_widget.dart';

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
export 'package:todo_app/feature/todo/presentation/widget/todo_list_component.dart';
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
