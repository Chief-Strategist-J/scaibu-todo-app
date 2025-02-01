import 'package:todo_app/core/app_library.dart';

class GetPaginatedTodosForProjectUseCase extends UseCase<ProjectEntity, Map<String, dynamic>> {
  final ProjectRepository<ProjectEntity> projectRepository;

  GetPaginatedTodosForProjectUseCase({required this.projectRepository});

  @override
  Future<Either<Failure, ProjectEntity>> call(Map<String, dynamic> params) async {
    try {
      final todos = await projectRepository.getPaginatedTodosForProject(params);
      return Right(todos);
    } catch (e, s) {
      logService.crashLog(errorMessage: 'Failed to get paginated todos for project', e: e, stack: s);
      return Left(ServerFailure('Failed to get paginated todos for project'));
    }
  }
}
