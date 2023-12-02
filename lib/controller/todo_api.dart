// Create a new user with a first and last name

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseApi {
  final db = FirebaseFirestore.instance;
  late final todoCollection = db.collection("todo");

  void addTodo(Map<String, dynamic> todo) {
    todoCollection.add(todo).then((DocumentReference doc) {
      print('DocumentSnapshot added with ID: ${doc.id}');
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getTodo() {
    return todoCollection.snapshots();
  }
}
