part of use_case;

/// Doc Required
class GetTagByIdUseCase extends UseCase<TagEntity?, String> {
  /// Doc Required
  GetTagByIdUseCase({
    required this.tagsFirebaseRepository,
    required this.tagsDatabaseRepository,
  });

  /// Doc Required
  final TagsRepository<TagEntity> tagsDatabaseRepository;

  /// Doc Required
  final TagsRepository<TagEntity> tagsFirebaseRepository;

  @override
  Future<Either<Failure, TagEntity?>> call(final String params) async {
    try {
      TagEntity? tag = await tagsFirebaseRepository.getTagById(params);
      tag ??= await tagsDatabaseRepository.getTagById(params);

      return Right<Failure, TagEntity?>(tag);
    } catch (e) {
      return Left<Failure, TagEntity?>(ServerFailure('Failed to fetch tag'));
    }
  }
}
