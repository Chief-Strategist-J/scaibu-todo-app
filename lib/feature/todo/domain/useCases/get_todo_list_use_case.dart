import 'package:todo_app/core/todo_library.dart';

class GetTodoListUseCase extends UseCase<List<TodoEntity>, bool> {
  final TodoRepository databaseRepo;
  final TodoRepository firebaseRepo;

  GetTodoListUseCase({required this.databaseRepo, required this.firebaseRepo});

  @override
  Future<Either<Failure, List<TodoEntity>>> call(bool isUpdateList) async {
    try {
      List<TodoEntity> todoList = [];

      todoList = await firebaseRepo.getListOfTodos();
      if (todoList.isEmpty) {
        todoList = await databaseRepo.getListOfTodos();
      }

      return Right(todoList);
    } on Exception catch (e, s) {
      logService.crashLog(errorMessage: 'Failed to create todo', e: e, stack: s);

      return Left(ServerFailure('Error fetching todo list'));
    }
  }
}
