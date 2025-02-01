import 'package:todo_app/core/app_library.dart';

class GetAllTagsUseCase extends UseCase<List<TagEntity>, NoParams> {
  final TagsRepository<TagEntity> tagsDatabaseRepository;
  final TagsRepository<TagEntity> tagsFirebaseRepository;

  GetAllTagsUseCase({required this.tagsFirebaseRepository, required this.tagsDatabaseRepository});

  @override
  Future<Either<Failure, List<TagEntity>>> call(NoParams params) async {
    try {
      final List<TagEntity> tags = await tagsFirebaseRepository.getAllTags();

      if (tags.isEmpty) {
        await tagsDatabaseRepository.getAllTags().then((value) {
          tags.addAll(value);
        });
      }
      return Right(tags);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch tags'));
    }
  }
}
