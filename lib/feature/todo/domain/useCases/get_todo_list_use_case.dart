import 'package:todo_app/core/todo_library.dart';

class GetTodoListUseCase extends UseCase<List<TodoEntity>, void> {
  final TodoRepository databaseRepo;
  final TodoRepository firebaseRepo;

  GetTodoListUseCase({required this.databaseRepo, required this.firebaseRepo});

  @override
  Future<Either<Failure, List<TodoEntity>>> call(void params) async {
    try {
      List<TodoEntity> todoList = [];

      todoList = await firebaseRepo.getListOfTodos();
      if (todoList.isEmpty) {
        todoList = await databaseRepo.getListOfTodos();
      }

      return Right(todoList);
    } on Exception catch (e,s) {
      logService.crashLog(errorMessage: 'Failed to create todo', stack: s);

      return Left(ServerFailure('Error fetching todo list'));
    }
  }
}
