part of use_case;
/// Doc Required
class UpdateTodoUseCase extends UseCase<void, UpdateTodoParam> {
  /// Doc Required
  UpdateTodoUseCase(
      {required final TodoRepository databaseRep})
      : _databaseRep = databaseRep;
  final TodoRepository _databaseRep;

  @override
  Future<Either<Failure, void>> call(final UpdateTodoParam params) async {
    try {
      await GetTodoListUseCase.clearEncryptedCache();
      return await _databaseRep
          .updateTodo(params.todoData, params.localID)
          .then((final void value) => const Right<Failure, void>(null));
    } catch (e, s) {
      await logService.crashLog(
        errorMessage: 'Failed to create todo',
        e: e,
        stack: s,
      );
      return Left<Failure, void>(ServerFailure('Failed to create todo'));
    }
  }
}

