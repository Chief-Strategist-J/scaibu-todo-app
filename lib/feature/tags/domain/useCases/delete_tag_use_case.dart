import 'package:todo_app/core/app_library.dart';

class DeleteTagUseCase extends UseCase<void, String> {
  final TagsRepository<TagEntity> tagsDatabaseRepository;
  final TagsRepository<TagEntity> tagsFirebaseRepository;

  DeleteTagUseCase({required this.tagsFirebaseRepository, required this.tagsDatabaseRepository});

  @override
  Future<Either<Failure, void>> call(String id) async {
    try {
      await tagsFirebaseRepository.deleteTag(id).then((value) async {
        await tagsDatabaseRepository.deleteTag(id);
      });
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to delete tag'));
    }
  }
}
