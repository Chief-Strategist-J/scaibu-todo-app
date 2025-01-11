import 'package:todo_app/core/app_library.dart';

class ProjectRepositoryImpl implements ProjectRepository<ProjectEntity> {
  ProjectRepositoryImpl(this.projectRemoteDataSource);

  final BaseProjectDataSource projectRemoteDataSource;

  @override
  Future<void> archiveProject(final String id) async =>
      projectRemoteDataSource.archiveProject(id);

  @override
  Future<void> bulkCreateProjects(
    final List<Map<String, dynamic>> data,
  ) async =>
      projectRemoteDataSource.bulkCreateProjects(data);

  @override
  Future<void> bulkDeleteProjects(final List<String> ids) async =>
      projectRemoteDataSource.bulkDeleteProjects(ids);

  @override
  Future<void> createProject(final Map<String, dynamic> data) async =>
      projectRemoteDataSource.createProject(data);

  @override
  Future<void> deleteProject(final String id) async =>
      projectRemoteDataSource.deleteProject(id);

  @override
  Future<List<ProjectEntity>> getAllProjects({final int page = 1}) async =>
      projectRemoteDataSource.getAllProjects(page: page);

  @override
  Future<ProjectEntity?> getProjectById(final String id) async =>
      projectRemoteDataSource.getProjectById(id);

  @override
  Future<void> restoreProject(final String id) async =>
      projectRemoteDataSource.restoreProject(id);

  @override
  Future<List<ProjectEntity>> searchProjects(final String query) async =>
      projectRemoteDataSource.searchProjects(query);

  @override
  Future<void> updateProject(
    final String id,
    final Map<String, dynamic> data,
  ) async =>
      projectRemoteDataSource.updateProject(id, data);

  @override
  Future<void> assignTodosToProjectsRequest(
    final Map<String, dynamic> data,
  ) async =>
      projectRemoteDataSource.assignTodosToProjectsRequest(data);

  @override
  Future<ProjectEntity> getPaginatedProjectsForTodo(
    final Map<String, dynamic> data,
  ) async =>
      projectRemoteDataSource.getPaginatedProjectsForTodo(data);

  @override
  Future<ProjectEntity> getPaginatedTodosForProject(
    final Map<String, dynamic> data,
  ) async =>
      projectRemoteDataSource.getPaginatedTodosForProject(data);

  @override
  Future<ProjectCategoryDataModelEntity> getProjectCategoryData() async =>
      projectRemoteDataSource.getProjectCategoryData();
}
