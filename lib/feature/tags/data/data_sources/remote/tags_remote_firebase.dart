import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/feature/tags/data/models/tags_model.dart';

class TagsRemoteFirebaseApi implements TagsRemoteBase<TagEntity> {
  final CollectionReference _tagsCollection = FirebaseFirestore.instance.collection('tags');
  final CollectionReference _todoCollection = FirebaseFirestore.instance.collection('todo');

  @override
  Future<void> archiveTag(String id) async {
    try {
      DocumentReference tagDoc = _tagsCollection.doc(id);
      // Set the archived field to true and clear deleted_at if it exists
      await tagDoc.update({
        'archived': true,
        'deleted_at': FieldValue.delete(), // Ensure deleted_at is removed
      });
    } on FirebaseException catch (e) {
      debugPrint('Firestore error while archiving tag: $e');
      throw Exception('Could not archive tag. Please try again later.');
    } catch (e) {
      debugPrint('Unexpected error while archiving tag: $e');
      throw Exception('An unexpected error occurred while archiving tag. Please try again.');
    }
  }

  @override
  Future<void> bulkCreateTags(List<Map<String, dynamic>> data) async {
    WriteBatch batch = FirebaseFirestore.instance.batch();

    try {
      for (Map<String, dynamic> tagData in data) {
        DocumentReference tagDoc = _tagsCollection.doc(); // Generate a new document reference
        batch.set(tagDoc, _prepareTagData(tagData)); // Prepare and set tag data in batch
        // Update the document ID in the 'id' field
        batch.update(tagDoc, {'id': tagDoc.id});

        // If todo_id is provided, create a tag in the to-do collection
        if (tagData['todo_id'] != null) {
          await _createTagInTodoCollection(tagData, tagDoc.id);
        }
      }

      await batch.commit(); // Commit the batch operation
    } on FirebaseException catch (e) {
      debugPrint('Firestore error while bulk creating tags: $e');
      throw Exception('Could not bulk create tags. Please try again later.');
    } catch (e) {
      debugPrint('Unexpected error while bulk creating tags: $e');
      throw Exception('An unexpected error occurred while bulk creating tags. Please try again.');
    }
  }

  @override
  Future<void> bulkDeleteTags(List<String> ids) async {
    WriteBatch batch = FirebaseFirestore.instance.batch();

    try {
      for (String id in ids) {
        DocumentReference tagDoc = _tagsCollection.doc(id);
        batch.update(tagDoc, {'deleted_at': DateTime.now().toIso8601String()});
        await _removeTagFromTodos(id); // Ensure to remove from todos
      }

      await batch.commit(); // Commit the batch operation
    } on FirebaseException catch (e) {
      debugPrint('Firestore error while bulk deleting tags: $e');
      throw Exception('Could not bulk delete tags. Please try again later.');
    } catch (e) {
      debugPrint('Unexpected error while bulk deleting tags: $e');
      throw Exception('An unexpected error occurred while bulk deleting tags. Please try again.');
    }
  }

  @override
  Future<void> createTag(Map<String, dynamic> data) async {
    try {
      // Create the tag in the Firestore collection
      DocumentReference tagDoc = await _tagsCollection.add(_prepareTagData(data));

      // Add the document ID to the 'id' field
      await tagDoc.update({'id': tagDoc.id});

      // If todo_id is provided, create a tag in the todo collection
      if (data['todo_id'] != null) {
        await _createTagInTodoCollection(data, tagDoc.id);
      }
    } on FirebaseException catch (e) {
      debugPrint('Firestore error: $e');
      throw Exception('Could not create tag. Please try again later.');
    } catch (e) {
      debugPrint('Unexpected error: $e');
      throw Exception('An unexpected error occurred. Please try again.');
    }
  }

  Map<String, dynamic> _prepareTagData(Map<String, dynamic> data) {
    return {
      'uuid': data['uuid'],
      'is_active': data['is_active'],
      'order': data['order'],
      'version': data['version'],
      'follower_count': data['follower_count'],
      'usage_count': data['usage_count'],
      'related_posts_count': data['related_posts_count'],
      'user_interaction_count': data['user_interaction_count'],
      'popularity_score': data['popularity_score']?.toDouble(),
      'name': data['name'],
      'slug': data['slug'],
      'meta_title': data['meta_title'],
      'color': data['color'],
      'image_url': data['image_url'],
      'tag_type': data['tag_type'],
      'content_type': data['content_type'],
      'description_vector': data['description_vector'],
      'meta_description': data['meta_description'],
      'description': data['description'],
      'geolocation_data': data['geolocation_data'] != null ? jsonEncode(data['geolocation_data']) : null,
      'meta_data': data['meta_data'] != null ? jsonEncode(data['meta_data']) : null,
      'deleted_at': (data['deleted_at'] as DateTime?)?.toIso8601String(),
      'created_by': data['created_by'],
      'parent_id': data['parent_id'],
      'todo_id': data['todo_id'],
      'last_trend_update': (data['last_trend_update'] as DateTime?)?.toIso8601String(),
      'last_used_at': (data['last_used_at'] as DateTime?)?.toIso8601String(),
      'created_at': (data['created_at'] as DateTime?)?.toIso8601String(),
      'updated_at': (data['updated_at'] as DateTime?)?.toIso8601String(),
    };
  }

  Future<void> _createTagInTodoCollection(Map<String, dynamic> data, String tagId) async {
    try {
      QuerySnapshot todoSnapshot = await _todoCollection.where('id', isEqualTo: data['todo_id']).limit(1).get();
      if (todoSnapshot.docs.isNotEmpty) {
        DocumentReference todoDoc = todoSnapshot.docs.first.reference;
        await todoDoc.update({
          'tags': FieldValue.arrayUnion([tagId])
        });
      } else {
        throw Exception('Todo with the specified ID does not exist.');
      }
    } on FirebaseException catch (e) {
      debugPrint('Firestore error while adding tag to todo: $e');
      throw Exception('Could not add tag to todo. Please try again later.');
    } catch (e) {
      debugPrint('Unexpected error while adding tag to todo: $e');
      throw Exception('An unexpected error occurred while adding tag to todo.');
    }
  }

  @override
  Future<void> deleteTag(String id) async {
    try {
      // Instead of deleting the tag, update it to mark as deleted
      await _tagsCollection.doc(id).update({'deleted_at': DateTime.now().toIso8601String()});
      await _removeTagFromTodos(id);
    } on FirebaseException catch (e) {
      debugPrint('Firestore error while deleting tag: $e');
      throw Exception('Could not delete tag. Please try again later.');
    } catch (e) {
      debugPrint('Unexpected error while deleting tag: $e');
      throw Exception('An unexpected error occurred while deleting tag.');
    }
  }

  Future<void> _removeTagFromTodos(String tagId) async {
    try {
      QuerySnapshot todoSnapshot = await _todoCollection.where('tags', arrayContains: tagId).get();
      for (QueryDocumentSnapshot todoDoc in todoSnapshot.docs) {
        await todoDoc.reference.update({
          'tags': FieldValue.arrayRemove([tagId]),
        });
      }
    } on FirebaseException catch (e) {
      debugPrint('Firestore error while removing tag from todos: $e');
      throw Exception('Could not remove tag from todos. Please try again later.');
    } catch (e) {
      debugPrint('Unexpected error while removing tag from todos: $e');
      throw Exception('An unexpected error occurred while removing tag from todos.');
    }
  }

  @override
  Future<List<TagEntity>> getAllTags({bool includeDeleted = false, bool includeArchived = false}) async {
    try {
      Query query = _tagsCollection;

      // If includeDeleted is false, filter out tags that are marked as deleted
      if (!includeDeleted) query = query.where('deleted_at', isEqualTo: null);
      // If includeArchived is false, filter out tags that are archived
      if (!includeArchived) query = query.where('archived', isEqualTo: false);

      QuerySnapshot snapshot = await query.get();
      List<TagsModel> tags = snapshot.docs.map((doc) {
        return TagsModel.fromJson(doc.data() as Map<String, dynamic>).copyWith(id: int.tryParse(doc.id) ?? 0);
      }).toList();

      return tags.cast<TagEntity>();
    } on FirebaseException catch (e) {
      debugPrint('Firestore error while fetching tags: $e');
      throw Exception('Could not retrieve tags. Please try again later.');
    } catch (e) {
      debugPrint('Unexpected error while fetching tags: $e');
      throw Exception('An unexpected error occurred while fetching tags.');
    }
  }

  @override
  Future<TagEntity> getTagById(String id) async {
    try {
      DocumentSnapshot doc = await _tagsCollection.doc(id).get();
      if (doc.exists) {
        return TagEntity.fromJson(doc.data() as Map<String, dynamic>);
      } else {
        throw Exception('Tag not found.');
      }
    } on FirebaseException catch (e) {
      debugPrint('Firestore error while fetching tag by ID: $e');
      throw Exception('Could not retrieve tag. Please try again later.');
    } catch (e) {
      debugPrint('Unexpected error while fetching tag by ID: $e');
      throw Exception('An unexpected error occurred while fetching tag.');
    }
  }

  @override
  Future<void> restoreTag(String id) async {
    try {
      await _tagsCollection.doc(id).update({
        'deleted_at': FieldValue.delete(), // Remove the deleted_at field to restore
        'archived': false // Optionally set archived to false
      });
    } on FirebaseException catch (e) {
      debugPrint('Firestore error while restoring tag: $e');
      throw Exception('Could not restore tag. Please try again later.');
    } catch (e) {
      debugPrint('Unexpected error while restoring tag: $e');
      throw Exception('An unexpected error occurred while restoring tag.');
    }
  }


  // TODO : UPDATE THIS LATER ALGOLIA SEARCH
  @override
  Future<List<TagEntity>> searchTags(String query) async {
    try {
      // Convert the query to lowercase for case-insensitive search
      String lowerCaseQuery = query.toLowerCase();

      // Retrieve all tags from Firestore
      QuerySnapshot snapshot = await _tagsCollection.get();

      // Filter tags that contain the query string (case-insensitive)
      List<TagsModel> tags = snapshot.docs.map((doc) {
        return TagsModel.fromJson(doc.data() as Map<String, dynamic>).copyWith(id: int.tryParse(doc.id) ?? 0);
      }).toList();

      List<TagsModel> filteredTags = tags.where((tag) => tag.name.validate().toLowerCase().contains(lowerCaseQuery)).toList();
      return filteredTags.cast<TagEntity>();
    } on FirebaseException catch (e) {
      debugPrint('Firestore error while searching tags: $e');
      throw Exception('Could not search tags. Please try again later.');
    } catch (e) {
      debugPrint('Unexpected error while searching tags: $e');
      throw Exception('An unexpected error occurred while searching tags.');
    }
  }

  @override
  Future<void> updateTag(String id, Map<String, dynamic> data) async {
    try {
      Map<String, dynamic> updatedData = _prepareTagData(data);
      await _tagsCollection.doc(id).update(updatedData);
    } on FirebaseException catch (e) {
      debugPrint('Firestore error while updating tag: $e');
      throw Exception('Could not update tag. Please try again later.');
    } catch (e) {
      debugPrint('Unexpected error while updating tag: $e');
      throw Exception('An unexpected error occurred while updating tag.');
    }
  }
}
