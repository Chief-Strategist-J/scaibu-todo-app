

import 'package:todo_app/core/todo_library.dart';

class FirebaseApiImpl implements BaseApi {
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final todoCollection = fireStore.collection("todo");

  @override
  Future<String> createTodo(Map<String, dynamic> todoData) async {
    String firebaseTodoID = '';

    await todoCollection.add(todoData).then((value) {
      value.update({'firebase_todo_id': value.id});
      firebaseTodoID = value.id;
    });

    return firebaseTodoID;
  }

  @override
  void deleteTodo(String todoId) {
    todoCollection.doc(todoId).delete();
  }

  @override
  Future<List<TodoModel>> getListOfTodos() async {
    final _todoList = <TodoModel>[];

    final value = await todoCollection.get();

    value.docs.map((e) {

      TodoModel _todo = TodoModel(
        todoId: parseToInt(e.data()['id']),
        firebaseTodoId: e.data()['firebase_todo_id'] ?? '',
        title: e.data()['title'],
        description: e.data()['description'],
      );

      _todoList.add(_todo);
      return e.data();
    }).toList();

    return _todoList;
  }

  int parseToInt(dynamic value, {int defaultValue = -1}) {
    if (value == null) return defaultValue;

    if (value is int) return value;

    if (value is String) {
      final intValue = int.tryParse(value);
      if (intValue != null) return intValue;
    }
    return defaultValue;
  }

  @override
  Future<void> updateTodo(String todoId, Map<String, dynamic> updateTodoData) async {
    await todoCollection.doc(todoId).update(updateTodoData);
  }
}
