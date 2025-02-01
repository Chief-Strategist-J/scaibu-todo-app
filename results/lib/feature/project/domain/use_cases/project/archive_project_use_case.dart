import 'package:todo_app/core/app_library.dart';

class ArchiveProjectUseCase extends UseCase<void, String> {
  final ProjectRepository<ProjectEntity> projectRepository;

  ArchiveProjectUseCase({required this.projectRepository});

  @override
  Future<Either<Failure, void>> call(String params) async {
    try {
      await projectRepository.archiveProject(params);
      return const Right(null);
    } catch (e, s) {
      await logService.crashLog(
          errorMessage: 'Failed to archive project', e: e, stack: s);
      return Left(ServerFailure('Failed to archive project'));
    }
  }
}
