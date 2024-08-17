import 'package:todo_app/core/app_library.dart';

class BulkCreateTagsUseCase extends UseCase<void, List<Map<String, dynamic>>> {
  final TagsRepository<TagEntity> tagsDatabaseRepository;
  final TagsRepository<TagEntity> tagsFirebaseRepository;

  BulkCreateTagsUseCase({required this.tagsFirebaseRepository, required this.tagsDatabaseRepository});

  @override
  Future<Either<Failure, void>> call(List<Map<String, dynamic>> params) async {
    try {
      await tagsDatabaseRepository.bulkCreateTags(params);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to bulk create tags'));
    }
  }
}
