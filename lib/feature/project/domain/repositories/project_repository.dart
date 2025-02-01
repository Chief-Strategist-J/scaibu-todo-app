import 'package:todo_app/feature/project/domain/entities/projectCategoryDataEntity/project_category_data_entity.dart';

/// Doc Required
abstract interface class ProjectRepository<T> {
  /// Doc Required
  Future<List<T>> getAllProjects({final int page});

  /// Doc Required
  Future<ProjectCategoryDataModelEntity> getProjectCategoryData();

  /// Doc Required
  Future<T?> getProjectById(final String id);

  /// Doc Required
  Future<void> assignTodosToProjectsRequest(final Map<String, dynamic> data);

  /// Doc Required
  Future<T> getPaginatedProjectsForTodo(final Map<String, dynamic> data);

  /// Doc Required
  Future<T> getPaginatedTodosForProject(final Map<String, dynamic> data);

  /// Doc Required
  Future<void> createProject(final Map<String, dynamic> data);

  /// Doc Required
  Future<void> updateProject(final String id, final Map<String, dynamic> data);

  /// Doc Required
  Future<void> deleteProject(final String id);

  /// Doc Required
  Future<List<T>> searchProjects(final String query);

  /// Doc Required
  Future<void> bulkCreateProjects(final List<Map<String, dynamic>> data);

  /// Doc Required
  Future<void> bulkDeleteProjects(final List<String> ids);

  /// Doc Required
  Future<void> archiveProject(final String id);

  /// Doc Required
  Future<void> restoreProject(final String id);
}
