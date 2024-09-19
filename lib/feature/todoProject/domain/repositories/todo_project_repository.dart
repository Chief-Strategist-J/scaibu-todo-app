abstract interface class TodoProjectRepository<T> {
  Future<List<T>> getAllProjects();

  Future<T?> getProjectById(String id);

  Future<void> assignTodosToProjectsRequest(Map<String, dynamic> data);

  Future<T> getPaginatedProjectsForTodo(Map<String,dynamic> data);

  Future<T> getPaginatedTodosForProject(Map<String,dynamic> data);

  Future<void> createProject(Map<String, dynamic> data);

  Future<void> updateProject(String id, Map<String, dynamic> data);

  Future<void> deleteProject(String id);

  Future<List<T>> searchProjects(String query);

  Future<void> bulkCreateProjects(List<Map<String, dynamic>> data);

  Future<void> bulkDeleteProjects(List<String> ids);

  Future<void> archiveProject(String id);

  Future<void> restoreProject(String id);
}
