part of use_case;

/// Doc Required
class DeleteTagUseCase extends UseCase<void, String> {
  /// Doc Required
  DeleteTagUseCase({
    required this.tagsFirebaseRepository,
    required this.tagsDatabaseRepository,
  });

  /// Doc Required
  final TagsRepository<TagEntity> tagsDatabaseRepository;

  /// Doc Required
  final TagsRepository<TagEntity> tagsFirebaseRepository;

  @override
  Future<Either<Failure, void>> call(final String params) async {
    try {
      await tagsFirebaseRepository
          .deleteTag(params)
          .then((final void value) async {
        await tagsDatabaseRepository.deleteTag(params);
      });
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(ServerFailure('Failed to delete tag'));
    }
  }
}
