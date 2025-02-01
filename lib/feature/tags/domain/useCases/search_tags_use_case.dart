part of use_case;

/// Doc Required
class SearchTagsUseCase extends UseCase<List<TagEntity>, String> {
  /// Doc Required
  SearchTagsUseCase({required this.tagsDatabaseRepository});

  /// Doc Required
  final TagsRepository<TagEntity> tagsDatabaseRepository;

  @override
  Future<Either<Failure, List<TagEntity>>> call(final String params) async {
    try {
      final List<TagEntity> tags =
          await tagsDatabaseRepository.searchTags(params);
      return Right<Failure, List<TagEntity>>(tags);
    } catch (e) {
      return Left<Failure, List<TagEntity>>(
        ServerFailure('Failed to search tags'),
      );
    }
  }
}
