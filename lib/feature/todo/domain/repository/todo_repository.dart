abstract interface class TodoRepository {
  Future<void> createTodo(Map<String, dynamic> todoData) async {}
  void updateTodo(Map<String, dynamic> todoData, String todoId) {}
  getListOfTodos();
  void deleteTodos(String todoId);
}
