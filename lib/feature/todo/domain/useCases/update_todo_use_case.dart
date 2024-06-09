import 'package:todo_app/core/todo_library.dart';

class UpdateTodoUseCase extends UseCase<void, UpdateTodoParam> {
  final TodoRepository databaseRep;
  final TodoRepository firebaseRepo;

  UpdateTodoUseCase({required this.databaseRep, required this.firebaseRepo});

  @override
  Future<Either<Failure, void>> call(UpdateTodoParam update) async {
    try {
      await firebaseRepo.updateTodo(update.todoData, update.firebaseID);
      await databaseRep.updateTodo(update.todoData, update.localID);

      return Right(null);
    } catch (e,s) {
      logService.crashLog(errorMessage: 'Failed to create todo',e: e, stack: s);

      return Left(ServerFailure('Failed to create todo'));
    }
  }
}

class UpdateTodoParam {
  final Map<String, dynamic> todoData;
  final String firebaseID;
  final String localID;

  UpdateTodoParam({
    required this.todoData,
    required this.firebaseID,
    required this.localID,
  });
}
