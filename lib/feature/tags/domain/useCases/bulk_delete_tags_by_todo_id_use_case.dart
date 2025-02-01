part of use_case;

/// Doc Required
class BulkDeleteTagsByTodoIdUseCase extends UseCase<void, String> {
  /// Doc Required
  BulkDeleteTagsByTodoIdUseCase({required this.tagsDatabaseRepository});

  /// Doc Required
  final TagsRepository<TagEntity> tagsDatabaseRepository;

  @override
  Future<Either<Failure, void>> call(final String params) async {
    try {
      await tagsDatabaseRepository.bulkDeleteTagsByTodoId(params);
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(
        ServerFailure('Failed to bulk delete tags by Todo ID'),
      );
    }
  }
}
