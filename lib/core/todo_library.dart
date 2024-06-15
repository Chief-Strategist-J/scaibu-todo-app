library todoLibrary;

export 'package:flutter/material.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:go_router/go_router.dart';
export 'package:firebase_core/firebase_core.dart';
export 'package:nb_utils/nb_utils.dart';
export 'package:flutter_hooks/flutter_hooks.dart';
export 'package:equatable/equatable.dart';
export 'package:easy_localization/easy_localization.dart' hide TextDirection;
export 'package:cloud_firestore/cloud_firestore.dart';
export 'package:get_it/get_it.dart';
export 'package:fpdart/src/either.dart';
export 'package:firebase_crashlytics/firebase_crashlytics.dart';
export 'package:flutter/foundation.dart';
export 'dart:convert';
export 'dart:io';
export 'dart:async';
export 'package:http/http.dart';
export 'package:todo_app/core/error/error_codes.dart';
export 'package:todo_app/core/network/network_config.dart';

/// CORE
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

/// SHARED
export 'package:todo_app/shared/widget/empty_widget.dart';
export 'package:todo_app/shared/widget/loading_widget.dart';

/// TODOs Feature
export 'package:todo_app/feature/todo/data/dataSource/base_api.dart';
export 'package:todo_app/feature/todo/data/dataSource/firebase_api_impl.dart';
export 'package:todo_app/feature/todo/data/dataSource/local_api_impl.dart';
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
export 'package:todo_app/feature/todo/presentation/widget/custom_button.dart';
export 'package:todo_app/feature/todo/presentation/widget/todo_list_item_component.dart';
export 'package:todo_app/feature/todo/domain/useCases/delete_todo_use_case.dart';
export 'package:todo_app/feature/todo/presentation/widget/param/parameters.dart';
export 'package:todo_app/feature/todo/presentation/page/manage_todo_page.dart';
