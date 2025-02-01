part of use_case;

/// Doc Required
class BulkCreateTagsUseCase extends UseCase<void, List<Map<String, dynamic>>> {
  /// Doc Required
  BulkCreateTagsUseCase({
    required this.tagsFirebaseRepository,
    required this.tagsDatabaseRepository,
  });

  /// Doc Required
  final TagsRepository<TagEntity> tagsDatabaseRepository;

  /// Doc Required
  final TagsRepository<TagEntity> tagsFirebaseRepository;

  @override
  Future<Either<Failure, void>> call(
    final List<Map<String, dynamic>> params,
  ) async {
    try {
      await tagsDatabaseRepository.bulkCreateTags(params);
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(ServerFailure('Failed to bulk create tags'));
    }
  }
}
