import 'package:todo_app/core/app_library.dart';

class BulkDeleteTagsUseCase extends UseCase<void, List<String>> {
  final TagsRepository<TagEntity> tagsDatabaseRepository;
  final TagsRepository<TagEntity> tagsFirebaseRepository;

  BulkDeleteTagsUseCase({required this.tagsFirebaseRepository, required this.tagsDatabaseRepository});

  @override
  Future<Either<Failure, void>> call(List<String> params) async {
    try {
      await tagsFirebaseRepository.bulkDeleteTags(params).then((value) async {
        await tagsDatabaseRepository.bulkDeleteTags(params);
      });
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to bulk delete tags'));
    }
  }
}
