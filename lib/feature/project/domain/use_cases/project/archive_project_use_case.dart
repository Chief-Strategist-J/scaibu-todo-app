import 'package:todo_app/core/app_library.dart';

class ArchiveProjectUseCase extends UseCase<void, String> {
  final TodoProjectRepository<ProjectEntity> projectRepository;

  ArchiveProjectUseCase({required this.projectRepository});

  @override
  Future<Either<Failure, void>> call(String id) async {
    try {
      await projectRepository.archiveProject(id);
      return const Right(null);
    } catch (e, s) {
      logService.crashLog(errorMessage: 'Failed to archive project', e: e, stack: s);
      return Left(ServerFailure('Failed to archive project'));
    }
  }
}
