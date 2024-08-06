import 'package:todo_app/core/app_library.dart';

class GetTodoListUseCase extends UseCase<List<TodoEntity>, bool> {
  final TodoRepository databaseRepo;
  final TodoRepository firebaseRepo;

  GetTodoListUseCase({required this.databaseRepo, required this.firebaseRepo});

  String get _todoListCacheKey => 'todoListCachedKey';

  Future<Box<dynamic>> get _fetchTodoBox async => await Hive.openBox('todoBox');

  @override
  Future<Either<Failure, List<TodoEntity>>> call(bool params) async {
    try {
      if (params) {
        return await _fetchRemoteList().then((todoList) => Right(todoList));
      }

      return await _fetchCachedOfflineList().then((todoList) async {
        if (todoList.isNotEmpty) return Right(todoList);

        return await _fetchRemoteList().then((value) => Right(todoList));
      });
    } on Exception catch (e, s) {
      logService.crashLog(errorMessage: 'Failed to create todo', e: e, stack: s);
      return Left(ServerFailure('Error fetching todo list'));
    }
  }

  Future<List<TodoEntity>> _fetchRemoteList() async {
    try {
      return await firebaseRepo.getListOfTodos().then((todoList) async {
        if (todoList.isNotEmpty) {
          return _storeInCachedList(todoList);
        } else {
          return await databaseRepo.getListOfTodos().then((list) async {
            return await _storeInCachedList(list);
          });
        }
      });
    } catch (e, s) {
      logService.crashLog(errorMessage: "something went wrong while retrieving list from firebase", e: e, stack: s);
      throw 'something went wrong $e';
    }
  }

  Future<List<TodoEntity>> _fetchCachedOfflineList() async {
    try {
      return await _fetchTodoBox.then((box) {
        var mapList = box.get(_todoListCacheKey) ?? [];
        if (mapList == null) return [];

        List<TodoEntity> offlineList = [];

        for (var element in mapList) {
          offlineList.add(TodoEntity(
            todoId: element['id'],
            title: element['title'],
            createdBy: element['created_by'],
            description: element['description'],
            isCompleted: element['is_completed'],
            firebaseTodoId: element['firebase_todo_id'],
            notes: element['notes'],
            startTime: element['start_time'],
            date: element['date'],
            endTime: element['end_time'],
            priority: element['priority']
          ));
        }

        return offlineList;
      });
    } catch (e, s) {
      logService.crashLog(errorMessage: "something went wrong while retrieving list from firebase", e: e, stack: s);
      throw 'something went wrong $e';
    }
  }

  Future<List<TodoEntity>> _storeInCachedList(List<TodoEntity> todoList) async {
    Box<dynamic> box = await _fetchTodoBox;
    List<Map<String, dynamic>> mapTodoList = [];

    for (TodoEntity element in todoList) {
      Map<String, dynamic> map = {
        'id': element.todoId,
        'title': element.title,
        'description': element.description,
        'is_completed': element.isCompleted,
        'created_by': element.createdBy,
        'firebase_todo_id': element.firebaseTodoId,
        'start_time': element.startTime,
        'end_time': element.endTime,
        'date': element.date,
        'notes': element.notes,
        'priority' : element.priority,
      };

      mapTodoList.add(map);
    }
    box.put(_todoListCacheKey, mapTodoList);

    return todoList;
  }
}
