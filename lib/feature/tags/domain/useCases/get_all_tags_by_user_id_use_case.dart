import 'package:todo_app/core/app_library.dart';

class GetAllTagsByUserIdUseCase extends UseCase<List<TagEntity>, Map<String, dynamic>> {
  final TagsRepository<TagEntity> tagsDatabaseRepository;
  final TagsRepository<TagEntity> tagsFirebaseRepository;

  GetAllTagsByUserIdUseCase({
    required this.tagsDatabaseRepository,
    required this.tagsFirebaseRepository,
  });

  @override
  Future<Either<Failure, List<TagEntity>>> call(Map<String, dynamic> params) async {
    try {
      final tags = await tagsDatabaseRepository.getAllTagsByUserId(params);
      return Right(tags);
    } catch (e) {
      return Left(ServerFailure('Failed to retrieve tags by user ID'));
    }
  }
}
