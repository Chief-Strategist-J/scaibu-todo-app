import 'package:fpdart/src/either.dart';
import 'package:todo_app/core/error/failure.dart';
import 'package:todo_app/core/useCases/use_case.dart';
import 'package:todo_app/feature/todo/domain/entity/todo_entity.dart';
import 'package:todo_app/feature/todo/domain/repository/todo_repository.dart';

class GetTodoListUseCase extends UseCase<List<TodoEntity>, void> {
  final TodoRepository? serverTodo;
  final TodoRepository? firebaseTodo;

  GetTodoListUseCase({
    this.serverTodo,
    this.firebaseTodo,
  });

  @override
  Future<Either<Failure, List<TodoEntity>>> call(void params) async {
    try {
      if (firebaseTodo != null) {
        final todoList = await serverTodo!.getListOfTodos();
        return Right(todoList);
      }
      if (serverTodo != null) {
        final todoList = await serverTodo!.getListOfTodos();
        return Right(todoList);
      }

      return Right(<TodoEntity>[]);
    } on Exception catch (e) {
      return Left(ServerFailure('Error happened'));
    }
  }
}
