import 'package:todo_app/core/app_library.dart';

class CreateTagUseCase extends UseCase<void, Map<String, dynamic>> {
  final TagsRepository<TagEntity> tagsDatabaseRepository;
  final TagsRepository<TagEntity> tagsFirebaseRepository;

  CreateTagUseCase({required this.tagsFirebaseRepository, required this.tagsDatabaseRepository});

  @override
  Future<Either<Failure, void>> call(Map<String, dynamic> params) async {
    try {
      await tagsFirebaseRepository.createTag(params).then((value) async {
        await tagsDatabaseRepository.createTag(params);
      });
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to create tag'));
    }
  }
}
