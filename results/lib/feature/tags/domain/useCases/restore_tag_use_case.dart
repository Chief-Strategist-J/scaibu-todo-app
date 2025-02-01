import 'package:todo_app/core/app_library.dart';

class RestoreTagUseCase extends UseCase<void, String> {
  final TagsRepository<TagEntity> tagsDatabaseRepository;
  final TagsRepository<TagEntity> tagsFirebaseRepository;

  RestoreTagUseCase({required this.tagsFirebaseRepository, required this.tagsDatabaseRepository});

  @override
  Future<Either<Failure, void>> call(String params) async {
    try {
      await tagsFirebaseRepository.restoreTag(params).then((value) async {
        await tagsDatabaseRepository.restoreTag(params);
      });
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to restore tag'));
    }
  }
}
