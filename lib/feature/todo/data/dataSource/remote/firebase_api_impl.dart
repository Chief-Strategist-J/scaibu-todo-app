import 'package:todo_app/core/app_library.dart';

class FirebaseApiImpl implements BaseApi {
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final todoCollection = fireStore.collection("todo");

  @override
  Future<String> createTodo(Map<String, dynamic> todoData) async {
    try {
      final docRef = await todoCollection.add(todoData);
      await docRef.update({'firebase_todo_id': docRef.id});

      log('FIREBASE API: CREATE TODO');

      return docRef.id;
    } catch (e) {
      log('ERROR CREATING TODO: $e');
      return '';
    }
  }

  @override
  Future<void> deleteTodo(String todoId) async {
    await todoCollection.doc(todoId).delete();
    log('FIREBASE API: DELETE TODO');
  }

  @override
  Future<List<TodoModel>> getListOfTodos() async {
    final todoList = <TodoModel>[];

    final value = await todoCollection.where('is_archived', isEqualTo: false).get();

    value.docs.map(
      (e) {
        TodoModel todo = TodoModel(
          todoId: parseService.parseToInt(e.data()['id']),
          firebaseTodoId: e.data()['firebase_todo_id'] ?? '',
          title: e.data()['title'],
          description: e.data()['description'],
          notes: e.data()['notes'],
          isCompleted: e.data()['is_completed'] ?? false,
          startTime: DateTime.parse(e.data()['start_time']),
          endTime: DateTime.parse(e.data()['end_time']),
          date: DateTime.parse(e.data()['date']),
        );

        todoList.add(todo);
        return e.data();
      },
    ).toList();

    log('FIREBASE API: GET LIST OF TODOS');

    return todoList;
  }

  @override
  Future<void> updateTodo(String todoId, Map<String, dynamic> updateTodoData) async {
    await todoCollection.doc(todoId).update(updateTodoData);
    log('FIREBASE API: UPDATE TODO');
  }
}
