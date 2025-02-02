import 'package:todo_app/core/app_library.dart';

/// Doc Required
class FirebaseApiImpl implements BaseApi {
  /// Doc Required
  static FirebaseFirestore fireStore = FirebaseFirestore.instance;

  /// Doc Required
  final CollectionReference<Map<String, dynamic>> todoCollection =
      fireStore.collection('todo');

  @override
  Future<String> createTodo(final Map<String, dynamic> todoData) async {
    try {
      final DocumentReference<Map<String, dynamic>> docRef =
          await todoCollection.add(todoData);

      await docRef.update(<Object, Object?>{'firebase_todo_id': docRef.id});

      log('FIREBASE API: CREATE TODO');
      return docRef.id;
    } catch (e) {
      log('ERROR CREATING TODO: $e');
      return '';
    }
  }

  @override
  Future<void> deleteTodo(final String todoId) async {
    await todoCollection.doc(todoId).delete().then((final void value) {
      log('FIREBASE API: DELETE TODO $todoId');
    }).catchError((final void e) {
      log('Error while deleting firebase todo');
    });
  }

  @override
  Future<List<TodoEntity>> getListOfTodos() async {
    final List<TodoEntity> todoList = <TodoEntity>[];

    final QuerySnapshot<Map<String, dynamic>> value = await todoCollection
        .where('is_archived', isEqualTo: false)
        .where('created_by', isEqualTo: userCredentials.getUserId)
        .get();

    value.docs.map((final QueryDocumentSnapshot<Map<String, dynamic>> e) {
      final TodoEntity todo = TodoEntity(
        todoId: parseService.parseToInt(e.data()['id']),
        firebaseTodoId: (e.data()['firebase_todo_id'] as String?) ?? '',
        title: (e.data()['title'] as String?) ?? '',
        description: (e.data()['description'] as String?) ?? '',
        notes: (e.data()['notes'] as String?) ?? '-1',
        createdBy: e.data()['created_by'] as int? ?? -1,
        isCompleted: (e.data()['is_completed'] as bool?) ?? false,
        startTime:
            timeService.parseDateTimeISO8601(e.data()['start_time'] as String),
        endTime:
            timeService.parseDateTimeISO8601(e.data()['end_time'] as String),
        date: timeService.parseDateTimeISO8601(e.data()['date'] as String),
        priority: e.data()['priority'] as String,
      );

      todoList.add(todo);
      return e.data();
    }).toList();

    log('FIREBASE API: GET LIST OF TODOS');

    return todoList;
  }

  @override
  Future<void> updateTodo(
    final String todoId,
    final Map<String, dynamic> updateTodoData,
  ) async {
    await todoCollection.doc(todoId).update(updateTodoData);
    log('FIREBASE API: UPDATE TODO');
  }
}
