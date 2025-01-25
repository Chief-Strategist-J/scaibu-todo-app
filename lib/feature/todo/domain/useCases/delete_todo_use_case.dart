part of use_case;

/// Doc Required
class DeleteTodoUseCase extends UseCase<void, DeleteTodoParam> {
  /// Doc Required

  DeleteTodoUseCase({
    required final TodoRepository databaseRep,
  }) : _databaseRep = databaseRep;

  final TodoRepository _databaseRep;

  @override
  Future<Either<Failure, void>> call(final DeleteTodoParam params) async {
    try {
      await GetTodoListUseCase.clearEncryptedCache();
      await _databaseRep.deleteTodos(params.localId);
      return const Right<Failure, void>(null);
    } catch (e, s) {
      await logService.crashLog(
        errorMessage: 'Delete todo api done',
        e: e,
        stack: s,
      );
      return Left<Failure, void>(ServerFailure('Delete todo api done'));
    }
  }
}

/// Doc Required

class DeleteTodoParam {
  /// Doc Required

  DeleteTodoParam({
    required this.firebaseId,
    required this.localId,
  });

  /// Doc Required
  final String firebaseId;

  /// Doc Required
  final String localId;
}
