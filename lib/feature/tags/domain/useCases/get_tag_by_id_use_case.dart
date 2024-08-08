import 'package:todo_app/core/app_library.dart';

class GetTagByIdUseCase extends UseCase<TagEntity?, String> {
  final TagsRepository<TagEntity> tagsDatabaseRepository;
  final TagsRepository<TagEntity> tagsFirebaseRepository;

  GetTagByIdUseCase({required this.tagsFirebaseRepository, required this.tagsDatabaseRepository});

  @override
  Future<Either<Failure, TagEntity?>> call(String params) async {
    try {
      TagEntity? tag = await tagsFirebaseRepository.getTagById(params);
      tag ??= await tagsDatabaseRepository.getTagById(params);

      return Right(tag);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch tag'));
    }
  }
}
