import 'package:todo_app/core/app_library.dart';

class DeleteProjectUseCase extends UseCase<void, String> {
  final ProjectRepository<ProjectEntity> projectRepository;

  DeleteProjectUseCase({required this.projectRepository});

  @override
  Future<Either<Failure, void>> call(String params) async {
    try {
      await projectRepository.deleteProject(params);
      return const Right(null);
    } catch (e, s) {
      logService.crashLog(errorMessage: 'Failed to delete project', e: e, stack: s);
      return Left(ServerFailure('Failed to delete project'));
    }
  }
}
