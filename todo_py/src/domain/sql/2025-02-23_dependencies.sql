
    CREATE TABLE IF NOT EXISTS dependencies (
        id SERIAL PRIMARY KEY,
        project_name VARCHAR(255),
        project_version VARCHAR(50),
        dependency_name VARCHAR(255),
        dependency_version VARCHAR(50),
        parent_dependency VARCHAR(255),
        file_name VARCHAR(255),
        sdk_version VARCHAR(100)
    );
    
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'analyzer', '6.11.0', NULL, '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'async', '2.12.0', 'analyzer', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'bloc', '8.1.4', 'async', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'bloc_test', '9.1.7', 'bloc', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'build_runner', '2.4.14', 'bloc_test', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'clean_architecture_with_state_management', '1.2.0', 'build_runner', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'cloud_firestore', '5.6.2', 'clean_architecture_with_state_management', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'collection', '1.19.1', 'cloud_firestore', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'cupertino_icons', '1.0.8', 'collection', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'dart_code_metrics_presets', '2.20.0', 'cupertino_icons', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'easy_localization', '3.0.7', 'dart_code_metrics_presets', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'encrypt', '5.0.3', 'easy_localization', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'envied', '1.1.0', 'encrypt', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'envied_generator', '1.1.0', 'envied', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'equatable', '2.0.7', 'envied_generator', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'firebase_analytics', '11.4.1', 'equatable', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'firebase_auth', '5.5.0', 'firebase_analytics', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'firebase_core', '3.12.0', 'firebase_auth', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'firebase_crashlytics', '4.3.1', 'firebase_core', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'flex_color_picker', '3.7.0', 'firebase_crashlytics', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'flutter', '0.0.0', 'flex_color_picker', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'flutter_bloc', '8.1.6', 'flutter', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'flutter_hooks', '0.20.5', 'flutter_bloc', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'flutter_lints', '5.0.0', 'flutter_hooks', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'flutter_secure_storage', '9.2.4', 'flutter_lints', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'flutter_svg', '2.0.17', 'flutter_secure_storage', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'flutter_test', '0.0.0', 'flutter_svg', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'fpdart', '1.1.1', 'flutter_test', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'freezed', '3.0.0', 'fpdart', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'freezed_annotation', '2.4.4', 'freezed', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'get_it', '7.7.0', 'freezed_annotation', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'go_router', '14.7.2', 'get_it', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'google_sign_in', '6.2.2', 'go_router', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'hive', '2.2.3', 'google_sign_in', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'http', '1.3.0', 'hive', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'json_annotation', '4.9.0', 'http', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'json_serializable', '6.9.3', 'json_annotation', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'lint', '2.3.0', 'json_serializable', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'lottie', '3.3.1', 'lint', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'mix', '1.5.3', 'lottie', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'mockito', '5.4.5', 'mix', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'nb_utils', '7.0.10', 'mockito', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'nested', '1.0.0', 'nb_utils', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'path_provider', '2.1.5', 'nested', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'percent_indicator', '4.2.4', 'path_provider', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'pillu_app', '1.0.0', 'percent_indicator', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'provider', '6.1.2', 'pillu_app', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'rxdart', '0.28.0', 'provider', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');
INSERT INTO dependencies (project_name, project_version, dependency_name, dependency_version, parent_dependency, file_name, sdk_version)
            VALUES ('todo_app', '1.0.0+1', 'tuple', '2.0.2', 'rxdart', '2025-02-23_15-56-04_deps_tree.log', 'Dart SDK 3.7.0, Flutter SDK 3.29.0');