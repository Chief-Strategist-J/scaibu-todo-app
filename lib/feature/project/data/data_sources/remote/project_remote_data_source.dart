import 'package:todo_app/core/app_library.dart';

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

  ProjectEndPoint._();
}

class TodoProjectRemoteDataSource implements TodoProjectRepository<ProjectModel> {
  final RestApi restApi;

  TodoProjectRemoteDataSource({required this.restApi});

  @override
  Future<void> archiveProject(String id) async {
    await restApi.request(
      endPoint: ProjectEndPoint.archiveProject,
      type: HttpRequestMethod.post,
      requestBody: {
        "project_id": id,
      },
    );
  }

  @override
  Future<void> bulkCreateProjects(List<Map<String, dynamic>> data) {
    // TODO: implement bulkCreateProjects
    throw UnimplementedError();
  }

  @override
  Future<void> bulkDeleteProjects(List<String> ids) async {
    await restApi.request(
      endPoint: ProjectEndPoint.bulkDeleteProjects,
      type: HttpRequestMethod.post,
      requestBody: {
        "project_ids": ids,
      },
    );
  }

  @override
  Future<void> createProject(Map<String, dynamic> data) async {
    await restApi.request(
      endPoint: ProjectEndPoint.createProject,
      type: HttpRequestMethod.post,
      requestBody: {
        "name": data["name"],
        "description": data["description"],
        "status": data["status"],
        "end_date": data["end_date"],
        "is_public": data["is_public"],
        "created_by": data["created_by"],
        "updated_by": data["updated_by"],
      },
    );
  }

  @override
  Future<void> deleteProject(String id) async {
    await restApi.request(
      endPoint: ProjectEndPoint.deleteProject,
      type: HttpRequestMethod.post,
      requestBody: {
        "project_id": id,
      },
    );
  }

  @override
  Future<List<ProjectModel>> getAllProjects() async {
    await restApi.request(
      endPoint: ProjectEndPoint.deleteProject,
      type: HttpRequestMethod.post,
      requestBody: {
        "creator_id": userCredentials.getUserId,
      },
    );

    return [];
  }

  @override
  Future<ProjectModel?> getProjectById(String id) async {
    // TODO: implement getProjectById

    throw UnimplementedError();
  }

  @override
  Future<void> restoreProject(String id) async {
    await restApi.request(
      endPoint: ProjectEndPoint.restoreProject,
      type: HttpRequestMethod.post,
      requestBody: {
        "project_id": id,
      },
    );
  }

  @override
  Future<List<ProjectModel>> searchProjects(String query) async {
    await restApi.request(
      endPoint: ProjectEndPoint.searchProjects,
      type: HttpRequestMethod.post,
      requestBody: {
        "search": query,
        "page": 1,
        "perPage": 20,
      },
    );

    return [];
  }

  @override
  Future<void> updateProject(String id, Map<String, dynamic> data) async {
    await restApi.request(
      endPoint: ProjectEndPoint.searchProjects,
      type: HttpRequestMethod.post,
      requestBody: {
        "creator_id": id,
        "name": data["name"],
        "slug": data["slug"],
        "description": data["description"],
        "status": data["status"],
        "project_code": data["project_code"],
        "is_public": data["is_public"],
      },
    );
  }

  @override
  Future<void> assignTodosToProjectsRequest(Map<String, dynamic> data) async {
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
  Future<ProjectModel> getPaginatedProjectsForTodo(Map<String, dynamic> data) async {
    await restApi.request(
      endPoint: ProjectEndPoint.getPaginatedProjectsForTodo,
      type: HttpRequestMethod.post,
      requestBody: {
        "todo_id": data["todo_id"],
        "user_id": data["user_id"],
        "page": 1,
      },
    );

    return const ProjectModel();
  }

  @override
  Future<ProjectModel> getPaginatedTodosForProject(Map<String, dynamic> data) async {
    await restApi.request(
      endPoint: ProjectEndPoint.getPaginatedTodosForProject,
      type: HttpRequestMethod.post,
      requestBody: {
        "project_id": data["project_id"],
        "user_id": data["user_id"],
        "page": 1,
      },
    );

    return const ProjectModel();
  }
}
