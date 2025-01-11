import 'package:todo_app/feature/project/domain/entities/projectCategoryDataEntity/project_category_data_entity.dart';

abstract interface class ProjectRepository<T> {
  Future<List<T>> getAllProjects({final int page});

  Future<ProjectCategoryDataModelEntity> getProjectCategoryData();

  Future<T?> getProjectById(final String id);

  Future<void> assignTodosToProjectsRequest(final Map<String, dynamic> data);

  Future<T> getPaginatedProjectsForTodo(final Map<String, dynamic> data);

  Future<T> getPaginatedTodosForProject(final Map<String, dynamic> data);

  Future<void> createProject(final Map<String, dynamic> data);

  Future<void> updateProject(final String id, final Map<String, dynamic> data);

  Future<void> deleteProject(final String id);

  Future<List<T>> searchProjects(final String query);

  Future<void> bulkCreateProjects(final List<Map<String, dynamic>> data);

  Future<void> bulkDeleteProjects(final List<String> ids);

  Future<void> archiveProject(final String id);

  Future<void> restoreProject(final String id);
}
