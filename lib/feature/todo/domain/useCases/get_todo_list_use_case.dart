import 'package:fpdart/src/either.dart';
import 'package:todo_app/core/error/failure.dart';
import 'package:todo_app/core/useCases/use_case.dart';
import 'package:todo_app/feature/todo/domain/entity/todo_entity.dart';
import 'package:todo_app/feature/todo/domain/repository/todo_repository.dart';

class GetTodoListUseCase extends UseCase<List<TodoEntity>, void> {
  final TodoRepository? databaseRepo;
  final TodoRepository? firebaseRepo;

  GetTodoListUseCase({
    this.databaseRepo,
    this.firebaseRepo,
  });

  @override
  Future<Either<Failure, List<TodoEntity>>> call(void params) async {
    try {
      if (firebaseRepo != null) {
        final todoList = (await firebaseRepo?.getListOfTodos()) ?? [];
        return Right(todoList);
      } else if (databaseRepo != null) {
        final todoList = (await databaseRepo?.getListOfTodos()) ?? [];
        return Right(todoList);
      }

      return Right(<TodoEntity>[]);
    } on Exception catch (_) {
      return Left(ServerFailure('Error happened'));
    }
  }
}
