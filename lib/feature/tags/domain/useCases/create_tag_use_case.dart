part of use_case;

/// Doc Required
class CreateTagUseCase extends UseCase<void, Map<String, dynamic>> {
  /// Doc Required
  CreateTagUseCase({
    required this.tagsFirebaseRepository,
    required this.tagsDatabaseRepository,
  });

  /// Doc Required
  final TagsRepository<TagEntity> tagsDatabaseRepository;

  /// Doc Required
  final TagsRepository<TagEntity> tagsFirebaseRepository;

  @override
  Future<Either<Failure, void>> call(final Map<String, dynamic> params) async {
    try {
      await tagsDatabaseRepository.createTag(params);
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(ServerFailure('Failed to create tag'));
    }
  }
}
