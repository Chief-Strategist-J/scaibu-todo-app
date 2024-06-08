import 'package:todo_app/core/todo_library.dart';
import 'package:todo_app/core/utils/parse_service.dart';

class FirebaseApiImpl implements BaseApi {
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final todoCollection = fireStore.collection("todo");

  @override
  Future<String> createTodo(Map<String, dynamic> todoData) async {
    try {
      final docRef = await todoCollection.add(todoData);
      await docRef.update({'firebase_todo_id': docRef.id});
      return docRef.id;
    } catch (e) {
      log('Error creating todo: $e');
      return '';
    }
  }

  @override
  Future<void> deleteTodo(String todoId) async {
    await todoCollection.doc(todoId).delete();
  }

  @override
  Future<List<TodoModel>> getListOfTodos() async {
    final _todoList = <TodoModel>[];

    final value = await todoCollection.where('is_archived',isEqualTo:  false).get();

    value.docs.map(
      (e) {
        TodoModel _todo = TodoModel(
          todoId: parseService.parseToInt(e.data()['id']),
          firebaseTodoId: e.data()['firebase_todo_id'] ?? '',
          title: e.data()['title'],
          description: e.data()['description'],
          isCompleted: e.data()['is_completed'] ?? false,
        );

        _todoList.add(_todo);
        return e.data();
      },
    ).toList();

    return _todoList;
  }

  @override
  Future<void> updateTodo(String todoId, Map<String, dynamic> updateTodoData) async {
    await todoCollection.doc(todoId).update(updateTodoData);
  }
}
