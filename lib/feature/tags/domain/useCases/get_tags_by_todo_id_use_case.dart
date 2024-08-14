import 'package:todo_app/core/app_library.dart';

class GetTagsByTodoIdUseCase extends UseCase<List<TagEntity>, String> {
  final TagsRepository<TagEntity> tagsDatabaseRepository;

  GetTagsByTodoIdUseCase({required this.tagsDatabaseRepository});

  @override
  Future<Either<Failure, List<TagEntity>>> call(String params) async {
    try {
      final tags = await tagsDatabaseRepository.getTagByTodoId(params);
      return Right(tags);
    } catch (e) {
      return Left(ServerFailure('Failed to retrieve seeded tags: $e'));
    }
  }
}

