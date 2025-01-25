import 'package:todo_app/core/app_library.dart';

class ProjectEndPoint {
  ProjectEndPoint._();
  static const String createProject = 'api/projects';
  static const String archiveProject = 'api/projects/archive';
  static const String assignTodosToProjects = 'api/projects/assignTodos';
  static const String bulkDeleteProjects = 'api/projects/bulkDelete';
  static const String deleteProject = 'api/projects/delete';
  static const String getPaginatedProjects = 'api/projects/getPaginated';
  static const String getPaginatedProjectsForTodo =
      'api/projects/getPaginatedProjectsForTodo';
  static const String getPaginatedTodosForProject =
      'api/projects/getPaginatedTodosForProject';
  static const String restoreProject = 'api/projects/restore';
  static const String searchProjects = 'api/projects/search';
  static const String updateProject = 'api/projects/updateProject';
  static const String getProjectCategoryDetail = 'api/getProjectCategoryDetail';
}

class ProjectRemoteDataSource implements BaseProjectDataSource {
  ProjectRemoteDataSource({required this.restApi});
  final RestApi restApi;

  @override
  Future<void> archiveProject(final String id) async {
    await restApi.request<Object>(
      endPoint: ProjectEndPoint.archiveProject,
      type: HttpRequestMethod.post,
      requestBody: <String, dynamic>{
        'project_id': id,
      },
    );
  }

  @override
  Future<void> bulkCreateProjects(final List<Map<String, dynamic>> data) {
    // TODO: implement bulkCreateProjects
    throw UnimplementedError();
  }

  @override
  Future<void> bulkDeleteProjects(final List<String> ids) async {
    await restApi.request<Object>(
      endPoint: ProjectEndPoint.bulkDeleteProjects,
      type: HttpRequestMethod.post,
      requestBody: <String, dynamic>{
        'project_ids': ids,
      },
    );
  }

  @override
  Future<void> createProject(final Map<String, dynamic> data) async {
    await restApi.request<Object>(
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

  @override
  Future<void> deleteProject(final String id) async {
    await restApi.request<Object>(
      endPoint: ProjectEndPoint.deleteProject,
      type: HttpRequestMethod.post,
      requestBody: <String, dynamic>{
        'project_id': id,
      },
    );
  }

  @override
  Future<List<ProjectEntity>> getAllProjects({final int page = 1}) async {
    // todo : getting response in paginated format to I have to change this logic later
    final res = await restApi.request<Object>(
      endPoint: ProjectEndPoint.getPaginatedProjects,
      type: HttpRequestMethod.post,
      requestBody: <String, num?>{
        'creator_id': userCredentials.getUserId,
      },
    );

    if (res is! Map<String, dynamic> || res['data'] == null) return <ProjectEntity>[];
    final List<dynamic> data = res['data'];

    final List<ProjectEntity> projects = data
        .map((final project) =>
            ProjectEntity.fromJson(project as Map<String, dynamic>))
        .toList();

    return projects;
  }

  @override
  Future<ProjectEntity?> getProjectById(final String id) async {
    // TODO: implement getProjectById
    throw UnimplementedError();
  }

  @override
  Future<void> restoreProject(final String id) async {
    await restApi.request<Object>(
      endPoint: ProjectEndPoint.restoreProject,
      type: HttpRequestMethod.post,
      requestBody: <String, dynamic>{
        'project_id': id,
      },
    );
  }

  @override
  Future<List<ProjectEntity>> searchProjects(final String query) async {
    await restApi.request<Object>(
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

  @override
  Future<void> updateProject(
      final String id, final Map<String, dynamic> data) async {
    await restApi.request<Object>(
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

  @override
  Future<void> assignTodosToProjectsRequest(
      final Map<String, dynamic> data) async {
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
  Future<ProjectEntity> getPaginatedProjectsForTodo(
      final Map<String, dynamic> data) async {
    await restApi.request<Object>(
      endPoint: ProjectEndPoint.getPaginatedProjectsForTodo,
      type: HttpRequestMethod.post,
      requestBody: <String,dynamic >{
        'todo_id': data['todo_id'],
        'user_id': data['user_id'],
        'page': 1,
      },
    );

    return const ProjectEntity();
  }

  @override
  Future<ProjectEntity> getPaginatedTodosForProject(
      final Map<String, dynamic> data) async {
    await restApi.request<Object>(
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

  @override
  Future<ProjectCategoryDataModelEntity> getProjectCategoryData() async {
    final ProjectCategoryDataModelEntity projectCategoryData
    = ProjectCategoryDataModelEntity.fromJson(
      await restApi.request(
        endPoint: ProjectEndPoint.getProjectCategoryDetail,
        requestBody: <String, dynamic>{},
      ),
    );
    return projectCategoryData;
  }
}
