import 'package:fpdart/src/either.dart';
import 'package:todo_app/core/error/failure.dart';
import 'package:todo_app/core/useCases/use_case.dart';
import 'package:todo_app/feature/todo/domain/repository/todo_repository.dart';

class CreateTodoUseCase extends UseCase<void, Map<String, dynamic>> {
  final TodoRepository todoRepository;

  CreateTodoUseCase(this.todoRepository);

  @override
  Future<Either<Failure, void>> call(Map<String, dynamic> params) async {
    try {
      await todoRepository.createTodo(params);
      return Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to create todo'));
    }
  }
}
