import 'package:todo_app/core/app_library.dart';

class GetPaginatedProjectsForTodoUseCase extends UseCase<ProjectEntity, Map<String, dynamic>> {
  final TodoProjectRepository<ProjectEntity> projectRepository;

  GetPaginatedProjectsForTodoUseCase({required this.projectRepository});

  @override
  Future<Either<Failure, ProjectEntity>> call(Map<String, dynamic> params) async {
    try {
      final project = await projectRepository.getPaginatedProjectsForTodo(params);
      return Right(project);
    } catch (e, s) {
      logService.crashLog(errorMessage: 'Failed to get paginated projects for todo', e: e, stack: s);
      return Left(ServerFailure('Failed to get paginated projects for todo'));
    }
  }
}
