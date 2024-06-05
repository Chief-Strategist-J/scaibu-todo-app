import 'package:fpdart/src/either.dart';
import 'package:todo_app/core/error/failure.dart';
import 'package:todo_app/core/useCases/use_case.dart';
import 'package:todo_app/feature/todo/domain/repository/todo_repository.dart';

class CreateTodoUseCase extends UseCase<void, Map<String, dynamic>> {
  final TodoRepository serverTodo;
  final TodoRepository firebaseTodo;

  CreateTodoUseCase({required this.serverTodo, required this.firebaseTodo});

  @override
  Future<Either<Failure, void>> call(Map<String, dynamic> params) async {
    try {
      final firebaseTodoId = await firebaseTodo.createTodo(params);
      final localServerTodoId = await serverTodo.createTodo(params);

      _updateFirebaseIdToLocalServer(localServerTodoId, firebaseTodoId);

      return Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to create todo'));
    }
  }

  void _updateFirebaseIdToLocalServer(String localServerTodoId, String firebaseTodoId) {
    final Map<String, dynamic> updateRequest = {
      'todo_id': localServerTodoId,
      'firebase_todo_id': firebaseTodoId,
    };

    firebaseTodo.updateTodo({'id': localServerTodoId}, firebaseTodoId);
    serverTodo.updateTodo(updateRequest, localServerTodoId);
  }
}
