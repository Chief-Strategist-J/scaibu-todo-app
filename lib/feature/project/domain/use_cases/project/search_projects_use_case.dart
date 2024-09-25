import 'package:todo_app/core/app_library.dart';

class SearchProjectsUseCase extends UseCase<List<ProjectEntity>, String> {
  final TodoProjectRepository<ProjectEntity> projectRepository;

  SearchProjectsUseCase({required this.projectRepository});

  @override
  Future<Either<Failure, List<ProjectEntity>>> call(String params) async {
    try {
      final projects = await projectRepository.searchProjects(params);
      return Right(projects);
    } catch (e, s) {
      logService.crashLog(errorMessage: 'Failed to search projects', e: e, stack: s);
      return Left(ServerFailure('Failed to search projects'));
    }
  }
}
