import 'package:todo_app/core/app_library.dart';

class BulkCreateProjectsUseCase extends UseCase<void, List<Map<String, dynamic>>> {
  final ProjectRepository<ProjectEntity> projectRepository;

  BulkCreateProjectsUseCase({required this.projectRepository});

  @override
  Future<Either<Failure, void>> call(List<Map<String, dynamic>> params) async {
    try {
      await projectRepository.bulkCreateProjects(params);
      return const Right(null);
    } catch (e, s) {
      logService.crashLog(errorMessage: 'Failed to bulk create projects', e: e, stack: s);
      return Left(ServerFailure('Failed to bulk create projects'));
    }
  }
}
