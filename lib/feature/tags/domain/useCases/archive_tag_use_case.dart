import 'package:todo_app/core/app_library.dart';

class ArchiveTagUseCase extends UseCase<void, String> {
  final TagsRepository<TagEntity> tagsDatabaseRepository;
  final TagsRepository<TagEntity> tagsFirebaseRepository;

  ArchiveTagUseCase({required this.tagsDatabaseRepository,required this.tagsFirebaseRepository});

  @override
  Future<Either<Failure, void>> call(String id) async {
    try {
      await tagsFirebaseRepository.archiveTag(id).then((value) async {
        await tagsDatabaseRepository.archiveTag(id);
      });
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to archive tag'));
    }
  }
}