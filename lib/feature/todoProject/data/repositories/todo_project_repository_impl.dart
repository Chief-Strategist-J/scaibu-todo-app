import 'package:todo_app/feature/todoProject/domain/entities/todo_project_entity.dart';
import 'package:todo_app/feature/todoProject/domain/repositories/todo_project_repository.dart';

class TodoProjectRepositoryImpl implements TodoProjectRepository<ProjectEntity> {
  @override
  Future<void> archiveProject(String id) {
    // TODO: implement archiveProject
    throw UnimplementedError();
  }

  @override
  Future<void> bulkCreateProjects(List<Map<String, dynamic>> data) {
    // TODO: implement bulkCreateProjects
    throw UnimplementedError();
  }

  @override
  Future<void> bulkDeleteProjects(List<String> ids) {
    // TODO: implement bulkDeleteProjects
    throw UnimplementedError();
  }

  @override
  Future<void> createProject(Map<String, dynamic> data) {
    // TODO: implement createProject
    throw UnimplementedError();
  }

  @override
  Future<void> deleteProject(String id) {
    // TODO: implement deleteProject
    throw UnimplementedError();
  }

  @override
  Future<List<ProjectEntity>> getAllProjects() {
    // TODO: implement getAllProjects
    throw UnimplementedError();
  }

  @override
  Future<ProjectEntity?> getProjectById(String id) {
    // TODO: implement getProjectById
    throw UnimplementedError();
  }

  @override
  Future<void> restoreProject(String id) {
    // TODO: implement restoreProject
    throw UnimplementedError();
  }

  @override
  Future<List<ProjectEntity>> searchProjects(String query) {
    // TODO: implement searchProjects
    throw UnimplementedError();
  }

  @override
  Future<void> updateProject(String id, Map<String, dynamic> data) {
    // TODO: implement updateProject
    throw UnimplementedError();
  }

  @override
  Future<void> assignTodosToProjectsRequest(Map<String, dynamic> data) async {
    // TODO: implement assignTodosToProjectsRequest
  }

  @override
  Future<ProjectEntity> getPaginatedProjectsForTodo(Map<String, dynamic> data) {
    // TODO: implement getPaginatedProjectsForTodo
    throw UnimplementedError();
  }

  @override
  Future<ProjectEntity> getPaginatedTodosForProject(Map<String, dynamic> data) {
    // TODO: implement getPaginatedTodosForProject
    throw UnimplementedError();
  }
}
