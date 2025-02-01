part of use_case;

/// Doc Required
class ArchiveTagUseCase extends UseCase<void, String> {
  /// Doc Required
  ArchiveTagUseCase({
    required this.tagsDatabaseRepository,
    required this.tagsFirebaseRepository,
  });

  /// Doc Required
  final TagsRepository<TagEntity> tagsDatabaseRepository;

  /// Doc Required
  final TagsRepository<TagEntity> tagsFirebaseRepository;

  @override
  Future<Either<Failure, void>> call(final String params) async {
    try {
      await tagsFirebaseRepository
          .archiveTag(params)
          .then((final void value) async {
        await tagsDatabaseRepository.archiveTag(params);
      });
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(ServerFailure('Failed to archive tag'));
    }
  }
}