import 'package:todo_app/core/app_library.dart';

class ProjectRepositoryImpl implements ProjectRepository<ProjectEntity> {
  final BaseProjectDataSource projectRemoteDataSource;

  ProjectRepositoryImpl(this.projectRemoteDataSource);

  @override
  Future<void> archiveProject(String id) async {
    return await projectRemoteDataSource.archiveProject(id);
  }

  @override
  Future<void> bulkCreateProjects(List<Map<String, dynamic>> data) async {
    return await projectRemoteDataSource.bulkCreateProjects(data);
  }

  @override
  Future<void> bulkDeleteProjects(List<String> ids) async {
    return await projectRemoteDataSource.bulkDeleteProjects(ids);
  }

  @override
  Future<void> createProject(Map<String, dynamic> data) async {
    return await projectRemoteDataSource.createProject(data);
  }

  @override
  Future<void> deleteProject(String id) async {
    return await projectRemoteDataSource.deleteProject(id);
  }

  @override
  Future<List<ProjectEntity>> getAllProjects({int page = 1}) async {
    return await projectRemoteDataSource.getAllProjects(page: page);
  }

  @override
  Future<ProjectEntity?> getProjectById(String id) async {
    return await projectRemoteDataSource.getProjectById(id);
  }

  @override
  Future<void> restoreProject(String id) async {
    return await projectRemoteDataSource.restoreProject(id);
  }

  @override
  Future<List<ProjectEntity>> searchProjects(String query) async {
    return await projectRemoteDataSource.searchProjects(query);
  }

  @override
  Future<void> updateProject(String id, Map<String, dynamic> data) async {
    return await projectRemoteDataSource.updateProject(id, data);
  }

  @override
  Future<void> assignTodosToProjectsRequest(Map<String, dynamic> data) async {
    return await projectRemoteDataSource.assignTodosToProjectsRequest(data);
  }

  @override
  Future<ProjectEntity> getPaginatedProjectsForTodo(Map<String, dynamic> data) async {
    return await projectRemoteDataSource.getPaginatedProjectsForTodo(data);
  }

  @override
  Future<ProjectEntity> getPaginatedTodosForProject(Map<String, dynamic> data) async {
    return await projectRemoteDataSource.getPaginatedTodosForProject(data);
  }

  @override
  Future<ProjectCategoryDataModelEntity> getProjectCategoryData() async {
    return await projectRemoteDataSource.getProjectCategoryData();
  }
}
