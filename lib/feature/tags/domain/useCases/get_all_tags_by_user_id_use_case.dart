part of use_case;

/// Doc Required
class GetAllTagsByUserIdUseCase
    extends UseCase<List<TagEntity>, Map<String, dynamic>> {
  /// Doc Required
  GetAllTagsByUserIdUseCase({
    required this.tagsDatabaseRepository,
    required this.tagsFirebaseRepository,
  });

  /// Doc Required
  final TagsRepository<TagEntity> tagsDatabaseRepository;

  /// Doc Required
  final TagsRepository<TagEntity> tagsFirebaseRepository;

  @override
  Future<Either<Failure, List<TagEntity>>> call(
    final Map<String, dynamic> params,
  ) async {
    try {
      final List<TagEntity> tags =
          await tagsDatabaseRepository.getAllTagsByUserId(params);
      return Right<Failure, List<TagEntity>>(tags);
    } catch (e) {
      return Left<Failure, List<TagEntity>>(
        ServerFailure('Failed to retrieve tags by user ID'),
      );
    }
  }
}
