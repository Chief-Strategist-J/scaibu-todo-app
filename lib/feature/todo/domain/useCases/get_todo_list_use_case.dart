import 'package:fpdart/src/either.dart';
import 'package:todo_app/core/error/failure.dart';
import 'package:todo_app/core/useCases/use_case.dart';
import 'package:todo_app/feature/todo/domain/entity/todo_entity.dart';
import 'package:todo_app/feature/todo/domain/repository/todo_repository.dart';

class GetTodoListUseCase extends UseCase<List<TodoEntity>, void> {
  final TodoRepository? server;
  final TodoRepository? firebaseServer;

  GetTodoListUseCase({
    this.server,
    this.firebaseServer,
  });

  @override
  Future<Either<Failure, List<TodoEntity>>> call(void params) async {
    try {
      if (firebaseServer != null) {
        final todoList = (await server?.getListOfTodos()) ?? [];
        return Right(todoList);
      } else if (server != null) {
        final todoList = (await server?.getListOfTodos()) ?? [];
        return Right(todoList);
      } else {
        return Right(<TodoEntity>[]);
      }
    } on Exception catch (_) {
      return Left(ServerFailure('Error happened'));
    }
  }
}
