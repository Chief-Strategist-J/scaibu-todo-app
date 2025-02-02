part of use_case;

/// Doc Required
class BulkDeleteTagsUseCase extends UseCase<void, List<String>> {
  /// Doc Required
  BulkDeleteTagsUseCase({
    required this.tagsFirebaseRepository,
    required this.tagsDatabaseRepository,
  });

  /// Doc Required
  final TagsRepository<TagEntity> tagsDatabaseRepository;

  /// Doc Required
  final TagsRepository<TagEntity> tagsFirebaseRepository;

  @override
  Future<Either<Failure, void>> call(final List<String> params) async {
    try {
      await tagsFirebaseRepository
          .bulkDeleteTags(params)
          .then((final void value) async {
        await tagsDatabaseRepository.bulkDeleteTags(params);
      });
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(ServerFailure('Failed to bulk delete tags'));
    }
  }
}
