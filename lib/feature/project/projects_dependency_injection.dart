import 'package:todo_app/core/app_library.dart';

class ProjectDependencyInjection {
  // Project Repository
  static const projectRepositoryImpl = 'project_repository_impl';

  // Use Cases
  static const assignTodosToProjectUseCase = 'assign_todos_to_project_use_case';
  static const bulkCreateProjectsUseCase = 'bulk_create_projects_use_case';
  static const bulkDeleteProjectsUseCase = 'bulk_delete_projects_use_case';
  static const createProjectUseCase = 'create_project_use_case';
  static const deleteProjectUseCase = 'delete_project_use_case';
  static const getAllProjectsUseCase = 'get_all_projects_use_case';
  static const getPaginatedProjectsForTodoUseCase = 'get_paginated_projects_for_todo_use_case';
  static const getPaginatedTodosForProjectUseCase = 'get_paginated_todos_for_project_use_case';
  static const getProjectByIdUseCase = 'get_project_by_id_use_case';
  static const restoreProjectUseCase = 'restore_project_use_case';
  static const searchProjectsUseCase = 'search_projects_use_case';
  static const updateProjectUseCase = 'update_project_use_case';

  // Bloc
  static const projectBloc = 'project_bloc';

  static void setup() {
    // Register Project Repository
    getIt.registerSingleton<TodoProjectRepository<ProjectEntity>>(
      instanceName: projectRepositoryImpl,
      ProjectRepositoryImpl(), // Assuming ProjectRepositoryImpl is your repository implementation.
    );

    // Register Use Cases
    getIt.registerSingleton<AssignTodosToProjectUseCase>(
      instanceName: assignTodosToProjectUseCase,
      AssignTodosToProjectUseCase(
        projectRepository: getIt<TodoProjectRepository<ProjectEntity>>(
          instanceName: projectRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<BulkCreateProjectsUseCase>(
      instanceName: bulkCreateProjectsUseCase,
      BulkCreateProjectsUseCase(
        projectRepository: getIt<TodoProjectRepository<ProjectEntity>>(
          instanceName: projectRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<BulkDeleteProjectsUseCase>(
      instanceName: bulkDeleteProjectsUseCase,
      BulkDeleteProjectsUseCase(
        projectRepository: getIt<TodoProjectRepository<ProjectEntity>>(
          instanceName: projectRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<CreateProjectUseCase>(
      instanceName: createProjectUseCase,
      CreateProjectUseCase(
        projectRepository: getIt<TodoProjectRepository<ProjectEntity>>(
          instanceName: projectRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<DeleteProjectUseCase>(
      instanceName: deleteProjectUseCase,
      DeleteProjectUseCase(
        projectRepository: getIt<TodoProjectRepository<ProjectEntity>>(
          instanceName: projectRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<GetAllProjectsUseCase>(
      instanceName: getAllProjectsUseCase,
      GetAllProjectsUseCase(
        projectRepository: getIt<TodoProjectRepository<ProjectEntity>>(
          instanceName: projectRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<GetPaginatedProjectsForTodoUseCase>(
      instanceName: getPaginatedProjectsForTodoUseCase,
      GetPaginatedProjectsForTodoUseCase(
        projectRepository: getIt<TodoProjectRepository<ProjectEntity>>(
          instanceName: projectRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<GetPaginatedTodosForProjectUseCase>(
      instanceName: getPaginatedTodosForProjectUseCase,
      GetPaginatedTodosForProjectUseCase(
        projectRepository: getIt<TodoProjectRepository<ProjectEntity>>(
          instanceName: projectRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<GetProjectByIdUseCase>(
      instanceName: getProjectByIdUseCase,
      GetProjectByIdUseCase(
        projectRepository: getIt<TodoProjectRepository<ProjectEntity>>(
          instanceName: projectRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<RestoreProjectUseCase>(
      instanceName: restoreProjectUseCase,
      RestoreProjectUseCase(
        projectRepository: getIt<TodoProjectRepository<ProjectEntity>>(
          instanceName: projectRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<SearchProjectsUseCase>(
      instanceName: searchProjectsUseCase,
      SearchProjectsUseCase(
        projectRepository: getIt<TodoProjectRepository<ProjectEntity>>(
          instanceName: projectRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<UpdateProjectUseCase>(
      instanceName: updateProjectUseCase,
      UpdateProjectUseCase(
        projectRepository: getIt<TodoProjectRepository<ProjectEntity>>(
          instanceName: projectRepositoryImpl,
        ),
      ),
    );

    getIt.registerSingleton<ProjectBloc>(
      instanceName: projectBloc,
      ProjectBloc(),
    );
  }

  static void dispose() {
    getIt.unregister<TodoProjectRepository<ProjectEntity>>(instanceName: projectRepositoryImpl);
    getIt.unregister<AssignTodosToProjectUseCase>(instanceName: assignTodosToProjectUseCase);
    getIt.unregister<BulkCreateProjectsUseCase>(instanceName: bulkCreateProjectsUseCase);
    getIt.unregister<BulkDeleteProjectsUseCase>(instanceName: bulkDeleteProjectsUseCase);
    getIt.unregister<CreateProjectUseCase>(instanceName: createProjectUseCase);
    getIt.unregister<DeleteProjectUseCase>(instanceName: deleteProjectUseCase);
    getIt.unregister<GetAllProjectsUseCase>(instanceName: getAllProjectsUseCase);
    getIt.unregister<GetPaginatedProjectsForTodoUseCase>(instanceName: getPaginatedProjectsForTodoUseCase);
    getIt.unregister<GetPaginatedTodosForProjectUseCase>(instanceName: getPaginatedTodosForProjectUseCase);
    getIt.unregister<GetProjectByIdUseCase>(instanceName: getProjectByIdUseCase);
    getIt.unregister<RestoreProjectUseCase>(instanceName: restoreProjectUseCase);
    getIt.unregister<SearchProjectsUseCase>(instanceName: searchProjectsUseCase);
    getIt.unregister<UpdateProjectUseCase>(instanceName: updateProjectUseCase);
    getIt.unregister<ProjectBloc>(instanceName: projectBloc);
  }
}
