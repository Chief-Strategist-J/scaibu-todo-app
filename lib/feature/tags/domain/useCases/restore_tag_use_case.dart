part of use_case;

/// Doc Required
class RestoreTagUseCase extends UseCase<void, String> {
  /// Doc Required
  RestoreTagUseCase({
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
          .restoreTag(params)
          .then((final dynamic value) async {
        await tagsDatabaseRepository.restoreTag(params);
      });
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(ServerFailure('Failed to restore tag'));
    }
  }
}
