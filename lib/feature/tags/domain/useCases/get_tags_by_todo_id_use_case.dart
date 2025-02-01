part of use_case;

/// Doc Required
class GetTagsByTodoIdUseCase extends UseCase<List<TagEntity>, String> {
  /// Doc Required
  GetTagsByTodoIdUseCase({required this.tagsDatabaseRepository});

  /// Doc Required
  final TagsRepository<TagEntity> tagsDatabaseRepository;

  @override
  Future<Either<Failure, List<TagEntity>>> call(final String params) async {
    try {
      final List<TagEntity> tags =
          await tagsDatabaseRepository.getTagByTodoId(params);
      return Right<Failure, List<TagEntity>>(tags);
    } catch (e) {
      return Left<Failure, List<TagEntity>>(
        ServerFailure('Failed to retrieve seeded tags: $e'),
      );
    }
  }
}
