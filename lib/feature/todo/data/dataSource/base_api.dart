abstract interface class BaseApi{
  void createTodo(Map<String,dynamic> todoData);
  void deleteTodo(String todoId);
  void updateTodo(String todoId,Map<String,dynamic> updateTodoData);
  void getListOfTodos();
}