import 'package:todo_app/core/app_library.dart';

class GetProjectByIdUseCase extends UseCase<ProjectEntity?, String> {
  final ProjectRepository<ProjectEntity> projectRepository;

  GetProjectByIdUseCase({required this.projectRepository});

  @override
  Future<Either<Failure, ProjectEntity?>> call(String params) async {
    try {
      final project = await projectRepository.getProjectById(params);
      return Right(project);
    } catch (e, s) {
      logService.crashLog(errorMessage: 'Failed to get project by ID', e: e, stack: s);
      return Left(ServerFailure('Failed to get project by ID'));
    }
  }
}
