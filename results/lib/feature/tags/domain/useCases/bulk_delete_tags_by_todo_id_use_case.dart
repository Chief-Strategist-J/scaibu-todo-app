import 'package:todo_app/core/app_library.dart';

class BulkDeleteTagsByTodoIdUseCase extends UseCase<void, String> {
  final TagsRepository<TagEntity> tagsDatabaseRepository;

  BulkDeleteTagsByTodoIdUseCase({required this.tagsDatabaseRepository});

  @override
  Future<Either<Failure, void>> call(String params) async {
    try {
      await tagsDatabaseRepository.bulkDeleteTagsByTodoId(params);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to bulk delete tags by Todo ID'));
    }
  }
}
