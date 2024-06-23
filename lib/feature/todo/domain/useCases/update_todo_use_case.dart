import 'package:todo_app/core/app_library.dart';

class UpdateTodoUseCase extends UseCase<void, UpdateTodoParam> {
  final TodoRepository databaseRep;
  final TodoRepository firebaseRepo;

  UpdateTodoUseCase({required this.databaseRep, required this.firebaseRepo});

  @override
  Future<Either<Failure, void>> call(UpdateTodoParam params) async {
    try {
      await firebaseRepo.updateTodo(params.todoData, params.firebaseID);
      await databaseRep.updateTodo(params.todoData, params.localID);

      return const Right(null);
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
