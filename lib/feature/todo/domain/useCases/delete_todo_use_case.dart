import 'package:todo_app/core/todo_library.dart';

class DeleteTodoUseCase extends UseCase<void, DeleteTodoParam> {
  final TodoRepository databaseRep;
  final TodoRepository firebaseRepo;

  DeleteTodoUseCase({required this.databaseRep, required this.firebaseRepo});

  @override
  Future<Either<Failure, void>> call(DeleteTodoParam params) async {
    try {
      await firebaseRepo.deleteTodos(params.firebaseId);
      await databaseRep.deleteTodos(params.localId);
      return Right(null);
    } catch (e, s) {
      logService.crashLog(errorMessage: 'Delete todo api done',e: e, stack: s);
      return Left(ServerFailure('Delete todo api done'));
    }
  }
}

class DeleteTodoParam {
  final String firebaseId;
  final String localId;

  DeleteTodoParam({
    required this.firebaseId,
    required this.localId,
  });
}
