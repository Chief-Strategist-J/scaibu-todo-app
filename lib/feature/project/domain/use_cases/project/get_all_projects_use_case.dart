import 'package:todo_app/core/app_library.dart';

class GetAllProjectsUseCase extends UseCase<List<ProjectEntity>, NoParams> {
  final TodoProjectRepository<ProjectEntity> projectRepository;

  GetAllProjectsUseCase({required this.projectRepository});

  @override
  Future<Either<Failure, List<ProjectEntity>>> call(NoParams params) async {
    try {
      final projects = await projectRepository.getAllProjects();
      return Right(projects);
    } catch (e, s) {
      logService.crashLog(errorMessage: 'Failed to get all projects', e: e, stack: s);
      return Left(ServerFailure('Failed to get all projects'));
    }
  }
}
