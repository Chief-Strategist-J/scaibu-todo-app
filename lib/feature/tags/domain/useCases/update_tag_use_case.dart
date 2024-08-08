import 'package:todo_app/core/app_library.dart';

class UpdateTagUseCase extends UseCase<void, Tuple2<String, Map<String, dynamic>>> {
  final TagsRepository<TagEntity> tagsDatabaseRepository;
  final TagsRepository<TagEntity> tagsFirebaseRepository;

  UpdateTagUseCase({required this.tagsFirebaseRepository, required this.tagsDatabaseRepository});

  @override
  Future<Either<Failure, void>> call(Tuple2<String, Map<String, dynamic>> params) async {
    try {
      await tagsFirebaseRepository.updateTag(params.item1, params.item2).then((value) {
        tagsDatabaseRepository.updateTag(params.item1, params.item2);
      });
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to update tag'));
    }
  }
}
