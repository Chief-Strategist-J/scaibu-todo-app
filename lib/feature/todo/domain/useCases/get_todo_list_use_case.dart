import 'package:todo_app/core/app_library.dart';

class GetTodoListUseCase extends UseCase<List<TodoEntity>, bool> {
  final TodoRepository databaseRepo;
  final TodoRepository firebaseRepo;

  GetTodoListUseCase({required this.databaseRepo, required this.firebaseRepo});

  @override
  Future<Either<Failure, List<TodoEntity>>> call(bool params) async {
    try {
      return await _fetchRemoteList().then((value) => Right(value));
    } on Exception catch (e, s) {
      logService.crashLog(errorMessage: 'Failed to create todo', e: e, stack: s);
      return Left(ServerFailure('Error fetching todo list'));
    }
  }

  Future<List<TodoEntity>> _fetchRemoteList() async {
    try {
      return await firebaseRepo.getListOfTodos().then((todoList) async {
        return todoList.isNotEmpty ? todoList : await databaseRepo.getListOfTodos();
      });
    } catch (e, s) {
      logService.crashLog(errorMessage: "something went wrong while retrieving list from firebase", e: e, stack: s);
      throw 'something went wrong $e';
    }
  }
}
