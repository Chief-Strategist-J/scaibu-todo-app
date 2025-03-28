import 'package:todo_app/core/app_library.dart';

/// Doc Required
abstract interface class BaseProjectDataSource
    implements ProjectRepository<ProjectEntity> {
  //
}

/// Doc Required
class ProjectEndPoint {
  ProjectEndPoint._();

  /// Doc Required
  static const String createProject = 'api/projects';

  /// Doc Required
  static const String archiveProject = 'api/projects/archive';

  /// Doc Required
  static const String assignTodosToProjects = 'api/projects/assignTodos';

  /// Doc Required
  static const String bulkDeleteProjects = 'api/projects/bulkDelete';

  /// Doc Required
  static const String deleteProject = 'api/projects/delete';

  /// Doc Required
  static const String getPaginatedProjects = 'api/projects/getPaginated';

  /// Doc Required
  static const String getPaginatedProjectsForTodo =
      'api/projects/getPaginatedProjectsForTodo';

  /// Doc Required
  static const String getPaginatedTodosForProject =
      'api/projects/getPaginatedTodosForProject';

  /// Doc Required
  static const String restoreProject = 'api/projects/restore';

  /// Doc Required
  static const String searchProjects = 'api/projects/search';

  /// Doc Required
  static const String updateProject = 'api/projects/updateProject';

  /// Doc Required
  static const String getProjectCategoryDetail = 'api/getProjectCategoryDetail';
}

/// Doc Required
class ProjectRemoteDataSource implements BaseProjectDataSource {
  /// Doc Required
  ProjectRemoteDataSource({required this.restApi});

  /// Doc Required
  final RestApi restApi;

  /// Doc Required
  @override
  Future<void> archiveProject(final String id) async {
    await restApi.request<dynamic>(
      endPoint: ProjectEndPoint.archiveProject,
      type: HttpRequestMethod.post,
      requestBody: <String, dynamic>{
        'project_id': id,
      },
    );
  }

  /// Doc Required
  @override
  Future<void> bulkCreateProjects(final List<Map<String, dynamic>> data) {
    // TO-DO: implement bulkCreateProjects
    throw UnimplementedError();
  }

  /// Doc Required
  @override
  Future<void> bulkDeleteProjects(final List<String> ids) async {
    await restApi.request<dynamic>(
      endPoint: ProjectEndPoint.bulkDeleteProjects,
      type: HttpRequestMethod.post,
      requestBody: <String, dynamic>{
        'project_ids': ids,
      },
    );
  }

  /// Doc Required
  @override
  Future<void> createProject(final Map<String, dynamic> data) async {
    await restApi.request<dynamic>(
      endPoint: ProjectEndPoint.createProject,
      type: HttpRequestMethod.post,
      requestBody: <String, dynamic>{
        'name': data['name'],
        'description': data['description'],
        'status': data['status'],
        'end_date': data['end_date'],
        'is_public': data['is_public'],
        'created_by': data['created_by'],
        'updated_by': data['updated_by'],
        'project_category_name': data['project_category_name'],
        'project_priority_name': data['project_priority_name'],
        'project_status_name': data['project_status_name'],
        'project_phase_name': data['project_phase_name'],
        'project_type_name': data['project_type_name'],
      },
    );
  }

  /// Doc Required
  @override
  Future<void> deleteProject(final int id) async {
    await restApi.request<dynamic>(
      endPoint: ProjectEndPoint.deleteProject,
      type: HttpRequestMethod.post,
      requestBody: <String, dynamic>{
        'project_id': id,
        'created_by': userCredentials.getUserId,
      },
    );
  }

  /// Doc Required
  @override
  Future<List<ProjectEntity>> getAllProjects({final int page = 1}) async {
    // to-do : getting response in paginated
    // format to I have to change this logic later
    final dynamic res = await restApi.request<dynamic>(
      endPoint: ProjectEndPoint.getPaginatedProjects,
      type: HttpRequestMethod.post,
      requestBody: <String, dynamic>{
        'creator_id': userCredentials.getUserId,
      },
    );

    if (res is! Map<String, dynamic> || res['data'] == null) {
      return <ProjectEntity>[];
    }
    final List<dynamic> data = res['data'] as List<dynamic>;

    final List<ProjectEntity> projects = data
        .map(
          (final dynamic project) =>
              ProjectEntity.fromJson(project as Map<String, dynamic>),
        )
        .toList();

    return projects;
  }

  /// Doc Required
  @override
  Future<ProjectEntity?> getProjectById(final String id) async {
    // TO-DO: implement getProjectById
    throw UnimplementedError();
  }

  /// Doc Required
  @override
  Future<void> restoreProject(final String id) async {
    await restApi.request<dynamic>(
      endPoint: ProjectEndPoint.restoreProject,
      type: HttpRequestMethod.post,
      requestBody: <String, dynamic>{
        'project_id': id,
      },
    );
  }

  /// Doc Required
  @override
  Future<List<ProjectEntity>> searchProjects(final String query) async {
    await restApi.request<dynamic>(
      endPoint: ProjectEndPoint.searchProjects,
      type: HttpRequestMethod.post,
      requestBody: <String, dynamic>{
        'search': query,
        'page': 1,
        'perPage': 20,
      },
    );

    return <ProjectEntity>[];
  }

  /// Doc Required
  @override
  Future<void> updateProject(
    final String id,
    final Map<String, dynamic> data,
  ) async {
    await restApi.request<dynamic>(
      endPoint: ProjectEndPoint.searchProjects,
      type: HttpRequestMethod.post,
      requestBody: <String, dynamic>{
        'creator_id': id,
        'name': data['name'],
        'slug': data['slug'],
        'description': data['description'],
        'status': data['status'],
        'project_code': data['project_code'],
        'is_public': data['is_public'],
      },
    );
  }

  /// Doc Required
  @override
  Future<void> assignTodosToProjectsRequest(
    final Map<String, dynamic> data,
  ) async {
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

    // TO-DO: implement assignTodosToProjectsRequest
  }

  /// Doc Required
  @override
  Future<ProjectEntity> getPaginatedProjectsForTodo(
    final Map<String, dynamic> data,
  ) async {
    await restApi.request<dynamic>(
      endPoint: ProjectEndPoint.getPaginatedProjectsForTodo,
      type: HttpRequestMethod.post,
      requestBody: <String, dynamic>{
        'todo_id': data['todo_id'],
        'user_id': data['user_id'],
        'page': 1,
      },
    );

    return const ProjectEntity();
  }

  /// Doc Required
  @override
  Future<ProjectEntity> getPaginatedTodosForProject(
    final Map<String, dynamic> data,
  ) async {
    await restApi.request<dynamic>(
      endPoint: ProjectEndPoint.getPaginatedTodosForProject,
      type: HttpRequestMethod.post,
      requestBody: <String, dynamic>{
        'project_id': data['project_id'],
        'user_id': data['user_id'],
        'page': 1,
      },
    );

    return const ProjectEntity();
  }

  /// Doc Required
  @override
  Future<ProjectCategoryDataModelEntity> getProjectCategoryData() async {
    final ProjectCategoryDataModelEntity projectCategoryData =
        ProjectCategoryDataModelEntity.fromJson(
      await restApi.request<Map<String, dynamic>>(
        endPoint: ProjectEndPoint.getProjectCategoryDetail,
        requestBody: <String, dynamic>{},
      ),
    );
    return projectCategoryData;
  }
}
