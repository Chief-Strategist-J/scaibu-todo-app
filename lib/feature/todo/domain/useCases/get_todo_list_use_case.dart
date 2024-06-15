import 'package:todo_app/core/todo_library.dart';

class GetTodoListUseCase extends UseCase<List<TodoEntity>, bool> {
  final TodoRepository databaseRepo;
  final TodoRepository firebaseRepo;

  GetTodoListUseCase({required this.databaseRepo, required this.firebaseRepo});

  String get todoListCachedKey => 'todoListCachedKey';

  Future<Box<dynamic>> get getTodoBox async {
    return await Hive.openBox('todoBox');
  }

  @override
  Future<Either<Failure, List<TodoEntity>>> call(bool shouldListIsUpdated) async {
    try {
      List<TodoEntity> todoList = [];

      if (shouldListIsUpdated) {
        todoList = await _getListFromRemote(todoList);
      } else {
        todoList = await _getStoredCachedOfflineList();

        if (todoList.isEmpty) {
          todoList = await _getListFromRemote(todoList);
        }
      }

      return Right(todoList);
    } on Exception catch (e, s) {
      logService.crashLog(errorMessage: 'Failed to create todo', e: e, stack: s);

      return Left(ServerFailure('Error fetching todo list'));
    }
  }

  Future<List<TodoEntity>> _getListFromRemote(List<TodoEntity> todoList) async {
    todoList = await firebaseRepo.getListOfTodos();

    if (todoList.isEmpty) {
      todoList = await databaseRepo.getListOfTodos();
    }

    await _storeInCachedList(todoList);
    return todoList;
  }

  Future<List<TodoEntity>> _getStoredCachedOfflineList() async {
    Box<dynamic> box = await getTodoBox;
    var mapList = box.get(todoListCachedKey) ?? [] as List<Map<String, dynamic>>?;
    List<TodoEntity> offlineList = [];

    if (mapList == null || mapList.isEmpty) {
      return [];
    }

    mapList.forEach(
      (element) {
        final todoEntity = TodoEntity(
          todoId: element['id'],
          title: element['title'],
          description: element['description'],
          isCompleted: element['is_completed'],
          firebaseTodoId: element['firebase_todo_id'],
        );
        offlineList.add(todoEntity);
      },
    );

    return offlineList;
  }

  Future<void> _storeInCachedList(List<TodoEntity> todoList) async {
    Box<dynamic> box = await getTodoBox;
    List<Map<String, dynamic>> mapTodoList = [];

    todoList.forEach((element) {
      Map<String, dynamic> map = {
        'id': element.todoId,
        'title': element.title,
        'description': element.description,
        'is_completed': element.isCompleted,
        'firebase_todo_id': element.firebaseTodoId,
      };

      mapTodoList.add(map);
    });

    box.put(todoListCachedKey, mapTodoList);
  }
}
