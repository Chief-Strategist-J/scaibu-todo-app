import 'package:todo_app/core/app_library.dart';

class UpdateTagUseCase extends UseCase<void, Tuple3<String, String, Map<String, dynamic>>> {
  final TagsRepository<TagEntity> tagsDatabaseRepository;
  final TagsRepository<TagEntity> tagsFirebaseRepository;

  UpdateTagUseCase({
    required this.tagsFirebaseRepository,
    required this.tagsDatabaseRepository,
  });

  @override
  Future<Either<Failure, void>> call(Tuple3<String, String, Map<String, dynamic>> params) async {
    final firebaseId = params.item1;
    final databaseId = params.item2;
    final dataToUpdate = params.item3;

    try {
      await tagsFirebaseRepository.updateTag(firebaseId, dataToUpdate);
      await tagsDatabaseRepository.updateTag(databaseId, dataToUpdate);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to update tag'));
    }
  }
}

