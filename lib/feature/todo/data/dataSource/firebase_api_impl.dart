import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/feature/todo/data/dataSource/base_api.dart';

class FirebaseApiImpl implements BaseApi {
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final todoCollection = fireStore.collection("todo");

  @override
  void createTodo(Map<String, dynamic> todoData) {
    todoCollection.add(todoData);
  }

  @override
  void deleteTodo(String todoId) {
    todoCollection.doc(todoId).delete();
  }

  @override
  Future<List<Map<String, dynamic>>> getListOfTodos() {
    return todoCollection.get().then((value) => value.docs.map((e) => e.data()).toList());
  }

  @override
  void updateTodo(String todoId, Map<String, dynamic> updateTodoData) {
    todoCollection.doc(todoId).update(updateTodoData);
  }
}
