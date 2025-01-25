part of use_case;

/// Create A to-do use case
class CreateTodoUseCase
    extends UseCase<Map<String, dynamic>, Map<String, dynamic>> {
  /// Create A to-do use case constructor
  CreateTodoUseCase({
    required final TodoRepository databaseRep,
    required final TodoRepository firebaseRepo,
  })  : _firebaseRepo = firebaseRepo,
        _databaseRep = databaseRep;

  final TodoRepository _databaseRep;
  final TodoRepository _firebaseRepo;

  @override
  Future<Either<Failure, Map<String, dynamic>>> call(
    final Map<String, dynamic> params,
  ) async {
    try {
      await GetTodoListUseCase.clearEncryptedCache();

      return await _firebaseRepo.createTodo(params).then(
            (final String todoId) async => _databaseRep
                .createTodo(params)
                .then((final String localTodoId) async {
              final Map<String, String> req = <String, String>{
                'id': localTodoId,
              };

              return _firebaseRepo
                  .updateTodoId(id: todoId, request: req)
                  .then((final bool value) async {
                final Map<String, String> serverReq = <String, String>{
                  'todo_id': localTodoId,
                  'firebase_todo_id': todoId,
                };

                return _databaseRep
                    .updateTodoId(id: localTodoId, request: serverReq)
                    .then(
                      (final bool value) =>
                          Right<Failure, Map<String, dynamic>>(serverReq),
                    );
              });
            }),
          );
    } on Exception catch (e, s) {
      await logService.crashLog(
        errorMessage: 'Failed to create todo',
        e: e,
        stack: s,
      );
      return Left<Failure, Map<String, dynamic>>(
        ServerFailure('Failed to create todo'),
      );
    }
  }
}
