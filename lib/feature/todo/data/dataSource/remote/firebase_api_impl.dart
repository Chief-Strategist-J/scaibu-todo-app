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
    await todoCollection.doc(todoId).delete().then(
      (value) {
        log('FIREBASE API: DELETE TODO $todoId');
      },
    ).catchError((e) {
      log("Error while deleting firebase todo");
    });
  }

  @override
  Future<List<TodoEntity>> getListOfTodos() async {
    final todoList = <TodoEntity>[];

    final value = await todoCollection.where('is_archived', isEqualTo: false).where('created_by', isEqualTo: userCredentials.getUserId).get();

    value.docs.map((e) {
      final todo = TodoEntity(
        todoId: parseService.parseToInt(e.data()['id']),
        firebaseTodoId: e.data()['firebase_todo_id'] ?? '',
        title: e.data()['title'],
        description: e.data()['description'],
        notes: e.data()['notes'] ?? -1,
        createdBy: e.data()['created_by'],
        isCompleted: e.data()['is_completed'] ?? false,
        startTime: timeService.parseDateTimeISO8601(e.data()['start_time']),
        endTime: timeService.parseDateTimeISO8601(e.data()['end_time']),
        date: timeService.parseDateTimeISO8601(e.data()['date']),
        priority: e.data()['priority'],
      );

      todoList.add(todo);
      return e.data();
    }).toList();

    log('FIREBASE API: GET LIST OF TODOS');

    return todoList;
  }

  @override
  Future<void> updateTodo(String todoId, Map<String, dynamic> updateTodoData) async {
    await todoCollection.doc(todoId).update(updateTodoData);
    log('FIREBASE API: UPDATE TODO');
  }
}
