import 'package:todo_app/core/app_library.dart';

class SearchTagsUseCase extends UseCase<List<TagEntity>, String> {
  final TagsRepository<TagEntity> tagsDatabaseRepository;

  SearchTagsUseCase({required this.tagsDatabaseRepository});

  @override
  Future<Either<Failure, List<TagEntity>>> call(String params) async {
    try {
      final tags = await tagsDatabaseRepository.searchTags(params);
      return Right(tags);
    } catch (e) {
      return Left(ServerFailure('Failed to search tags'));
    }
  }
}
