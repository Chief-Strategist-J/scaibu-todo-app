import 'package:todo_app/core/app_library.dart';

class ArchiveTagUseCase extends UseCase<void, String> {
  final TagsRepository<TagEntity> tagsDatabaseRepository;
  final TagsRepository<TagEntity> tagsFirebaseRepository;

  ArchiveTagUseCase({required this.tagsDatabaseRepository,required this.tagsFirebaseRepository});

  @override
  Future<Either<Failure, void>> call(String params) async {
    try {
      await tagsFirebaseRepository.archiveTag(params).then((value) async {
        await tagsDatabaseRepository.archiveTag(params);
      });
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to archive tag'));
    }
  }
}