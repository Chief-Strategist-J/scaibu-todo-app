import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/todoProject/data/models/todo_project_model.dart';
import 'package:todo_app/feature/todoProject/domain/repositories/todo_project_repository.dart';

class ProjectEndPoint {
  static const String createProject = 'api/projects';
  static const String archiveProject = 'api/projects/archive';
  static const String assignTodosToProjects = 'api/projects/assignTodos';
  static const String bulkDeleteProjects = 'api/projects/bulkDelete';
  static const String deleteProject = 'api/projects/delete';
  static const String getPaginatedProjects = 'api/projects/getPaginated';
  static const String getPaginatedProjectsForTodo = 'api/projects/getPaginatedProjectsForTodo';
  static const String getPaginatedTodosForProject = 'api/projects/getPaginatedTodosForProject';
  static const String restoreProject = 'api/projects/restore';
  static const String searchProjects = 'api/projects/search';
  static const String updateProject = 'api/projects/updateProject';

  ProjectEndPoint._(); // Private constructor to prevent instantiation
}

class TodoProjectRemoteDataSource implements TodoProjectRepository<TodoProjectModel> {
  final RestApi restApi;

  TodoProjectRemoteDataSource({required this.restApi});

  @override
  Future<void> archiveProject(String id) {
    // {
    //     "project_id": 1
    // }
    //

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
    // {
    //     "project_ids": [1, 2, 3]
    // }
    //

    // TODO: implement bulkDeleteProjects
    throw UnimplementedError();
  }

  @override
  Future<void> createProject(Map<String, dynamic> data) {
    // {
    //     "name": "Project A",
    //     "description": "This is the description of Project A.",
    //     "status": "active",
    //     "end_date": "2024-12-31",
    //     "is_public": true,
    //     "created_by": 1,
    //     "updated_by": 2
    //  }
    // TODO: implement createProject

    throw UnimplementedError();
  }

  @override
  Future<void> deleteProject(String id) {
    // {
    //     "project_id": 1
    // }
    //
    // TODO: implement deleteProject
    throw UnimplementedError();
  }

  @override
  Future<List<TodoProjectModel>> getAllProjects() {
    // {
    //     "creator_id": 1
    // }

    // TODO: implement getAllProjects
    throw UnimplementedError();
  }

  @override
  Future<TodoProjectModel?> getProjectById(String id) {
    // TODO: implement getProjectById
    throw UnimplementedError();
  }

  @override
  Future<void> restoreProject(String id) {
    //{
    //     "project_id": 1
    // }
    //

    // TODO: implement restoreProject
    throw UnimplementedError();
  }

  @override
  Future<List<TodoProjectModel>> searchProjects(String query) {
    // {
    //     "search": "Project",
    //     "page": 1,
    //     "perPage": 20
    // }
    //

    // TODO: implement searchProjects
    throw UnimplementedError();
  }

  @override
  Future<void> updateProject(String id, Map<String, dynamic> data) {
    //{
    //     "creator_id": 1,
    //     "name": "Project A",
    //     "slug": "project-a",
    //     "description": "This is the description of Project A.",
    //     "status": "active",
    //     "project_code": "PRJ-ABC123",
    //     "is_public": true
    // }

    // TODO: implement updateProject
    throw UnimplementedError();
  }

  @override
  Future<void> assignTodosToProjectsRequest(Map<String, dynamic> data) async  {
    // {
    //     "assignments": [
    //         {
    //             "project_id": 1,
    //             "todo_id": 101,
    //             "order": 1,
    //             "added_by": 5,
    //             "is_critical_path": true,
    //             "created_by": 5
    //         },
    //         {
    //             "project_id": 2,
    //             "todo_id": 102,
    //             "order": 2,
    //             "added_by": 6,
    //             "is_critical_path": false,
    //             "created_by": 6
    //         }
    //     ]
    // }

    // TODO: implement assignTodosToProjectsRequest
  }

  @override
  Future<TodoProjectModel> getPaginatedProjectsForTodo(Map<String, dynamic> data) {

    // {
    //     "todo_id": 101,
    //     "user_id": 5,
    //     "page": 1
    // }

    // TODO: implement getPaginatedProjectsForTodo
    throw UnimplementedError();
  }

  @override
  Future<TodoProjectModel> getPaginatedTodosForProject(Map<String, dynamic> data) {
    //{
    //     "project_id": 1,
    //     "user_id": 5,
    //     "page": 1
    // }

    // TODO: implement getPaginatedTodosForProject
    throw UnimplementedError();
  }
}
