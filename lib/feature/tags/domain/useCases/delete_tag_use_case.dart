import 'package:todo_app/core/app_library.dart';

class DeleteTagUseCase extends UseCase<void, String> {
  final TagsRepository<TagEntity> tagsDatabaseRepository;
  final TagsRepository<TagEntity> tagsFirebaseRepository;

  DeleteTagUseCase({required this.tagsFirebaseRepository, required this.tagsDatabaseRepository});

  @override
  Future<Either<Failure, void>> call(String params) async {
    try {
      await tagsFirebaseRepository.deleteTag(params).then((value) async {
        await tagsDatabaseRepository.deleteTag(params);
      });
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to delete tag'));
    }
  }
}
