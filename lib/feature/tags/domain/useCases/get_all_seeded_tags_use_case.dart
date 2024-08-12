import 'package:todo_app/core/app_library.dart';

class GetAllSeededTagsUseCase extends UseCase<List<TagEntity>, NoParams> {
  final HelperTagRepository<TagEntity> tagsDatabaseRepository;

  GetAllSeededTagsUseCase({required this.tagsDatabaseRepository});

  @override
  Future<Either<Failure, List<TagEntity>>> call(NoParams params) async {
    try {
      final tags = await tagsDatabaseRepository.getAllSeededTags();
      return Right(tags);
    } catch (e) {
      return Left(ServerFailure('Failed to retrieve seeded tags: $e'));
    }
  }
}
