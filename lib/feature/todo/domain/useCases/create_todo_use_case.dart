import 'package:todo_app/core/todo_library.dart';

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
      await firebaseRepo.updateTodoId(id: todoId, request: req);

      final Map<String, String> serverReq = {'todo_id': localTodoId, 'firebase_todo_id': todoId};
      await databaseRep.updateTodoId(id: localTodoId, request: serverReq);

      return const Right(null);
    } catch (e,s) {
      logService.crashLog(errorMessage: 'Failed to create todo',e: e, stack: s);
      return Left(ServerFailure('Failed to create todo'));
    }
  }
}
