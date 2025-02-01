import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/project/data/dataSources/remotes/project_remote_data_source.dart';

/// Doc Required
class ProjectDependencyInjection {
  /// Doc Required
  static const String projectRepositoryImpl = 'project_repository_impl';

  // Use Cases
  /// Doc Required
  static const String assignTodosToProjectUseCase =
      'assign_todos_to_project_use_case';

  /// Doc Required
  static const String bulkCreateProjectsUseCase =
      'bulk_create_projects_use_case';

  /// Doc Required
  static const String bulkDeleteProjectsUseCase =
      'bulk_delete_projects_use_case';

  /// Doc Required
  static const String createProjectUseCase = 'create_project_use_case';

  /// Doc Required
  static const String deleteProjectUseCase = 'delete_project_use_case';

  /// Doc Required
  static const String getAllProjectsUseCase = 'get_all_projects_use_case';

  /// Doc Required
  static const String getPaginatedProjectsForTodoUseCase =
      'get_paginated_projects_for_todo_use_case';

  /// Doc Required
  static const String getPaginatedTodosForProjectUseCase =
      'get_paginated_todos_for_project_use_case';

  /// Doc Required
  static const String getProjectByIdUseCase = 'get_project_by_id_use_case';

  /// Doc Required
  static const String restoreProjectUseCase = 'restore_project_use_case';

  /// Doc Required
  static const String searchProjectsUseCase = 'search_projects_use_case';

  /// Doc Required
  static const String updateProjectUseCase = 'update_project_use_case';

  /// Doc Required
  static const String getProjectCategoryDataUseCase =
      'get_project_category_data_use_case';

  // Bloc
  /// Doc Required
  static const String projectBloc = 'project_bloc';

  /// Doc Required
  static void setup() {
    getIt
      ..registerSingleton<BaseProjectDataSource>(
        ProjectRemoteDataSource(restApi: getIt<RestApi>()),
    )..registerSingleton<ProjectRepository<ProjectEntity>>(
      ProjectRepositoryImpl(getIt<BaseProjectDataSource>()),
      instanceName: projectRepositoryImpl,
    )..registerSingleton<AssignTodosToProjectUseCase>(
      instanceName: assignTodosToProjectUseCase,
      AssignTodosToProjectUseCase(
        projectRepository: getIt<ProjectRepository<ProjectEntity>>(
          instanceName: projectRepositoryImpl,
        ),
      ),
    )..registerSingleton<BulkCreateProjectsUseCase>(
      instanceName: bulkCreateProjectsUseCase,
      BulkCreateProjectsUseCase(
        projectRepository: getIt<ProjectRepository<ProjectEntity>>(
          instanceName: projectRepositoryImpl,
        ),
      ),
    )..registerSingleton<BulkDeleteProjectsUseCase>(
      instanceName: bulkDeleteProjectsUseCase,
      BulkDeleteProjectsUseCase(
        projectRepository: getIt<ProjectRepository<ProjectEntity>>(
          instanceName: projectRepositoryImpl,
        ),
      ),
    )..registerSingleton<CreateProjectUseCase>(
      instanceName: createProjectUseCase,
      CreateProjectUseCase(
        projectRepository: getIt<ProjectRepository<ProjectEntity>>(
          instanceName: projectRepositoryImpl,
        ),
      ),
    )..registerSingleton<DeleteProjectUseCase>(
      instanceName: deleteProjectUseCase,
      DeleteProjectUseCase(
        projectRepository: getIt<ProjectRepository<ProjectEntity>>(
          instanceName: projectRepositoryImpl,
        ),
      ),
    )..registerSingleton<GetAllProjectsUseCase>(
      instanceName: getAllProjectsUseCase,
      GetAllProjectsUseCase(
        projectRepository: getIt<ProjectRepository<ProjectEntity>>(
          instanceName: projectRepositoryImpl,
        ),
      ),
    )..registerSingleton<GetPaginatedProjectsForTodoUseCase>(
      instanceName: getPaginatedProjectsForTodoUseCase,
      GetPaginatedProjectsForTodoUseCase(
        projectRepository: getIt<ProjectRepository<ProjectEntity>>(
          instanceName: projectRepositoryImpl,
        ),
      ),
    )..registerSingleton<GetPaginatedTodosForProjectUseCase>(
      instanceName: getPaginatedTodosForProjectUseCase,
      GetPaginatedTodosForProjectUseCase(
        projectRepository: getIt<ProjectRepository<ProjectEntity>>(
          instanceName: projectRepositoryImpl,
        ),
      ),
    )..registerSingleton<GetProjectByIdUseCase>(
      instanceName: getProjectByIdUseCase,
      GetProjectByIdUseCase(
        projectRepository: getIt<ProjectRepository<ProjectEntity>>(
          instanceName: projectRepositoryImpl,
        ),
      ),
    )..registerSingleton<RestoreProjectUseCase>(
      instanceName: restoreProjectUseCase,
      RestoreProjectUseCase(
        projectRepository: getIt<ProjectRepository<ProjectEntity>>(
          instanceName: projectRepositoryImpl,
        ),
      ),
    )..registerSingleton<SearchProjectsUseCase>(
      instanceName: searchProjectsUseCase,
      SearchProjectsUseCase(
        projectRepository: getIt<ProjectRepository<ProjectEntity>>(
          instanceName: projectRepositoryImpl,
        ),
      ),
    )..registerSingleton<UpdateProjectUseCase>(
      instanceName: updateProjectUseCase,
      UpdateProjectUseCase(
        projectRepository: getIt<ProjectRepository<ProjectEntity>>(
          instanceName: projectRepositoryImpl,
        ),
      ),
    )..registerSingleton<GetProjectCategoryDataUseCase>(
      instanceName: getProjectCategoryDataUseCase,
      GetProjectCategoryDataUseCase(
        projectRepository: getIt<ProjectRepository<ProjectEntity>>(
          instanceName: projectRepositoryImpl,
        ),
      ),
    )..registerSingleton<ProjectBloc>(
      instanceName: projectBloc,
      ProjectBloc(),
    );
  }

  /// Doc Required
  static Future<void> dispose() async {
    getIt
      ..unregister<ProjectRepository<ProjectEntity>>(
        instanceName: projectRepositoryImpl,
      )
      ..unregister<AssignTodosToProjectUseCase>(
        instanceName: assignTodosToProjectUseCase,
      )
      ..unregister<BulkCreateProjectsUseCase>(
        instanceName: bulkCreateProjectsUseCase,
      )
      ..unregister<BulkDeleteProjectsUseCase>(
        instanceName: bulkDeleteProjectsUseCase,
      )
      ..unregister<CreateProjectUseCase>(instanceName: createProjectUseCase)
      ..unregister<DeleteProjectUseCase>(instanceName: deleteProjectUseCase)
      ..unregister<GetAllProjectsUseCase>(instanceName: getAllProjectsUseCase)
      ..unregister<GetPaginatedProjectsForTodoUseCase>(
        instanceName: getPaginatedProjectsForTodoUseCase,
      )
      ..unregister<GetPaginatedTodosForProjectUseCase>(
        instanceName: getPaginatedTodosForProjectUseCase,
      )
      ..unregister<GetProjectByIdUseCase>(instanceName: getProjectByIdUseCase)
      ..unregister<RestoreProjectUseCase>(instanceName: restoreProjectUseCase)
      ..unregister<SearchProjectsUseCase>(instanceName: searchProjectsUseCase)
      ..unregister<UpdateProjectUseCase>(instanceName: updateProjectUseCase)
      ..unregister<GetProjectCategoryDataUseCase>(
        instanceName: getProjectCategoryDataUseCase,
      )
      ..unregister<ProjectBloc>(instanceName: projectBloc);
  }
}
