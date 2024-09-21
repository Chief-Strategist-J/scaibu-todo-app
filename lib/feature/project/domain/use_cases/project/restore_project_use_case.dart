import 'package:todo_app/core/app_library.dart';

class RestoreProjectUseCase extends UseCase<void, String> {
  final TodoProjectRepository<ProjectEntity> projectRepository;

  RestoreProjectUseCase({required this.projectRepository});

  @override
  Future<Either<Failure, void>> call(String id) async {
    try {
      await projectRepository.restoreProject(id);
      return const Right(null);
    } catch (e, s) {
      logService.crashLog(errorMessage: 'Failed to restore project', e: e, stack: s);
      return Left(ServerFailure('Failed to restore project'));
    }
  }
}
