import 'package:todo_app/core/app_library.dart';

class CreateTodoUseCase extends UseCase<Map<String, dynamic>, Map<String, dynamic>> {
  final TodoRepository databaseRep;
  final TodoRepository firebaseRepo;

  CreateTodoUseCase({required this.databaseRep, required this.firebaseRepo});

  @override
  Future<Either<Failure, Map<String, dynamic>>> call(Map<String, dynamic> params) async {
    try {
      return await firebaseRepo.createTodo(params).then((todoId) async {
        return await databaseRep.createTodo(params).then((localTodoId) async {
          final Map<String, String> req = {'id': localTodoId};

          return await firebaseRepo.updateTodoId(id: todoId, request: req).then((value) async {
            final Map<String, String> serverReq = {'todo_id': localTodoId, 'firebase_todo_id': todoId};

            return await databaseRep.updateTodoId(id: localTodoId, request: serverReq).then((value) {
              return Right(serverReq);
            });
          });
        });
      });
    } catch (e, s) {
      logService.crashLog(errorMessage: 'Failed to create todo', e: e, stack: s);
      return Left(ServerFailure('Failed to create todo'));
    }
  }
}
