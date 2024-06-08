import 'package:fpdart/src/either.dart';
import 'package:todo_app/core/error/failure.dart';
import 'package:todo_app/core/useCases/use_case.dart';
import 'package:todo_app/feature/todo/domain/repository/todo_repository.dart';

class CreateTodoUseCase extends UseCase<void, Map<String, dynamic>> {
  final TodoRepository databaseRep;
  final TodoRepository firebaseRepo;

  CreateTodoUseCase({required this.databaseRep, required this.firebaseRepo});

  @override
  Future<Either<Failure, void>> call(Map<String, dynamic> params) async {
    try {
      final todoId = await firebaseRepo.createTodo(params);
      final localTodoId = await databaseRep.createTodo(params);

      /// Update created to-do id
      final Map<String, String> req = {'id': localTodoId};
      await firebaseRepo.updateTodoId(Id: localTodoId, request: req);

      final Map<String, String> serverReq = {'todo_id': localTodoId, 'firebase_todo_id': todoId};
      await databaseRep.updateTodoId(Id: todoId, request: serverReq);

      return Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to create todo'));
    }
  }
}
