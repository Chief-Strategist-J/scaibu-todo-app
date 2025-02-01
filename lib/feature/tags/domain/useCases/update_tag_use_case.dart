part of use_case;

/// Doc Required
class UpdateTagUseCase
    extends UseCase<void, Tuple3<String, String, Map<String, dynamic>>> {
  /// Doc Required
  UpdateTagUseCase({
    required this.tagsFirebaseRepository,
    required this.tagsDatabaseRepository,
  });

  /// Doc Required
  final TagsRepository<TagEntity> tagsDatabaseRepository;

  /// Doc Required
  final TagsRepository<TagEntity> tagsFirebaseRepository;

  @override
  Future<Either<Failure, void>> call(
    final Tuple3<String, String, Map<String, dynamic>> params,
  ) async {
    final String firebaseId = params.item1;
    final String databaseId = params.item2;
    final Map<String, dynamic> dataToUpdate = params.item3;

    try {
      await tagsFirebaseRepository.updateTag(firebaseId, dataToUpdate);
      await tagsDatabaseRepository.updateTag(databaseId, dataToUpdate);
      return const Right<Failure, void>(null);
    } catch (e) {
      return Left<Failure, void>(ServerFailure('Failed to update tag'));
    }
  }
}

