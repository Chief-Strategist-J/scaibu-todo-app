part of use_case;

/// Doc Required
class GetAllTagsUseCase extends UseCase<List<TagEntity>, NoParams> {
  /// Doc Required
  GetAllTagsUseCase({
    required this.tagsFirebaseRepository,
    required this.tagsDatabaseRepository,
  });

  /// Doc Required
  final TagsRepository<TagEntity> tagsDatabaseRepository;

  /// Doc Required
  final TagsRepository<TagEntity> tagsFirebaseRepository;

  @override
  Future<Either<Failure, List<TagEntity>>> call(final NoParams params) async {
    try {
      final List<TagEntity> tags = await tagsFirebaseRepository.getAllTags();

      if (tags.isEmpty) {
        await tagsDatabaseRepository.getAllTags().then(tags.addAll);
      }
      return Right<Failure, List<TagEntity>>(tags);
    } catch (e) {
      return Left<Failure, List<TagEntity>>(
        ServerFailure('Failed to fetch tags'),
      );
    }
  }
}
